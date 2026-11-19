# Architecture du projet CinéFile

Ce document décrit où se trouve chaque partie du code. Il suit la **documentation prévisionnelle de l'API v0.4** (18/11/2026) : chaque dossier de `src/app/api/` correspond à une route de la section 5.

Les dossiers existent déjà dans le dépôt. Un fichier `.gitkeep` sert seulement à ce que git conserve un dossier vide : supprimez-le dès que vous ajoutez un vrai fichier dans ce dossier.

## Stack

- **Next.js 16** (App Router) : front et API dans le même projet
- **TypeScript**, **Tailwind CSS v4**
- **PostgreSQL** + **Prisma 7**
- **Zod** (validation), **bcrypt** (mots de passe), **jsonwebtoken** (JWT dans le cookie `cinefile_token`)

## Arborescence

```
cinefile/
├── prisma/
│   ├── schema.prisma            Les modèles : seule source de vérité pour la base
│   └── migrations/              Historique SQL (ne jamais modifier une migration déjà appliquée)
├── generated/prisma/            Client Prisma généré par `npx prisma generate` : ne jamais modifier
├── public/                      Fichiers statiques (images, icônes)
├── docs/                        Documentation du projet
├── .env                         DATABASE_URL, JWT_SECRET, TMDB_TOKEN (jamais commité)
│
└── src/
    ├── proxy.ts                 Redirections rapides (ex. /admin → /connexion) ; pas l'autorisation
    │
    ├── app/                     Pages et routes API (le chemin du dossier = l'URL)
    │   ├── layout.tsx
    │   ├── page.tsx                         /              Accueil (films tendance)
    │   ├── globals.css
    │   ├── (auth)/                          Groupe de routes : n'apparaît pas dans l'URL
    │   │   ├── connexion/                   /connexion
    │   │   └── inscription/                 /inscription
    │   ├── films/                           /films         Catalogue, recherche, filtre
    │   │   └── [id]/                        /films/12      Fiche film
    │   ├── listes/                          /listes        Mes listes
    │   │   └── [id]/                        /listes/3      Détail d'une liste
    │   ├── profil/                          /profil        Mon profil et mes réglages
    │   │   └── [id]/                        /profil/8      Profil public
    │   ├── fil/                             /fil           Fil d'activité
    │   ├── admin/                           /admin         Réservé au rôle administrateur
    │   │   ├── films/
    │   │   └── avis/
    │   │
    │   └── api/                             Les 37 endpoints MVP (un route.ts par dossier)
    │       ├── auth/
    │       │   ├── inscription/                   POST
    │       │   ├── connexion/                     POST
    │       │   └── deconnexion/                   POST
    │       ├── films/                             GET              catalogue
    │       │   ├── tendances/                     GET
    │       │   └── [id]/                          GET              fiche
    │       │       └── avis/                      GET, POST
    │       ├── genres/                            GET
    │       ├── avis/[id]/                         PATCH, DELETE
    │       ├── listes/                            POST
    │       │   └── [id]/                          GET, PATCH, DELETE
    │       │       ├── ordre/                     PUT
    │       │       └── films/                     POST
    │       │           └── [filmId]/              DELETE
    │       ├── membres/                           GET              recherche par pseudo
    │       │   ├── moi/                           GET, PATCH, DELETE
    │       │   │   ├── email/                     PATCH
    │       │   │   ├── mot-de-passe/              PATCH
    │       │   │   ├── listes/                    GET
    │       │   │   └── abonnements/               GET
    │       │   └── [id]/                          GET
    │       │       ├── avis/                      GET
    │       │       ├── listes/                    GET
    │       │       └── abonnement/                POST, DELETE
    │       ├── fil/                               GET
    │       └── admin/
    │           ├── films/                         POST             import TMDB
    │           │   └── [id]/                      PATCH
    │           │       └── synchronisation/       POST
    │           └── avis/[id]/                     PATCH, DELETE
    │
    ├── lib/                     Outils techniques, sans règle métier
    │   ├── prisma.ts            Client Prisma partagé (existe déjà)
    │   ├── auth.ts              Signer/vérifier le JWT, lire le cookie, exigerMembre(), exigerAdmin()
    │   ├── api.ts               Classe ApiError + format d'erreur { statut, code, message, details }
    │   ├── pagination.ts        Lecture de page/limite, réponse { donnees, pagination }
    │   └── tmdb.ts              Appel TMDB (append_to_response=credits,videos,watch/providers)
    │
    ├── validators/              Schémas Zod des données reçues (corps et paramètres d'URL)
    │   ├── commun.ts            id, page, limite
    │   ├── auth.ts              inscription, connexion
    │   ├── films.ts             q, genre, tri, ordre
    │   ├── avis.ts              note (0.5 à 5, pas de 0.5), critique (2 000 caractères max)
    │   ├── listes.ts            nom, publique, filmId, filmIds
    │   ├── membres.ts           profil, email, mot de passe
    │   └── admin.ts             idTmdb, modification d'un film, masque
    │
    ├── types/                   Objets renvoyés par l'API (section 7 de la doc)
    │   └── dto.ts               FilmResume, FilmDetail, Avis, ListeResume, ListeDetail,
    │                            MembreResume, MembrePublic, MembrePrive, Activite
    │
    ├── services/                Logique métier + requêtes Prisma + conversion base → DTO
    │   ├── films.service.ts
    │   ├── avis.service.ts
    │   ├── listes.service.ts
    │   ├── membres.service.ts
    │   ├── abonnements.service.ts
    │   ├── fil.service.ts
    │   └── admin-films.service.ts       Import et synchronisation TMDB
    │
    └── components/              Composants React, rangés par domaine
        ├── ui/                  Génériques : boutons, étoiles de notation, pagination
        ├── layout/              En-tête, navigation
        ├── movie/               Carte film, grille, lecteur de bande-annonce
        ├── review/              Formulaire et carte d'avis
        ├── list/                Carte de liste, réordonnancement
        ├── profile/             En-tête de profil, bouton suivre
        └── admin/               Import TMDB, modération
```

Les fichiers listés dans `lib/`, `validators/`, `types/` et `services/` sont ceux qui sont **prévus**. Seul `lib/prisma.ts` existe pour l'instant.

## Le trajet d'une requête

Toutes les routes API suivent le même chemin :

```
route.ts  →  validators/  →  services/  →  Prisma (lib/prisma.ts)
```

| Couche | Rôle | Ne fait pas |
|---|---|---|
| `app/api/**/route.ts` | Vérifie l'accès (`exigerMembre()`, `exigerAdmin()`), valide avec Zod, appelle un service, renvoie le code HTTP | Pas de requête Prisma directe, pas de règle métier |
| `validators/` | Décrit la forme des données reçues | Pas d'accès à la base |
| `services/` | Règles métier (« avis déjà publié → 409 », « liste À voir → 403 », « liste privée d'un autre membre → 404 »), requêtes Prisma, conversion des noms de la base vers ceux de l'API (`titreFilm` → `titre`) | Ne lit ni la requête HTTP ni les cookies |
| `lib/` | Outils techniques réutilisables | Aucune règle métier |

Les **pages** (`page.tsx`) appellent directement les services côté serveur, sans passer par `fetch('/api/...')`. L'API sert aux composants clients et aux tests.

## Règles à respecter

- **Modèles** : on modifie uniquement `prisma/schema.prisma`, puis `npx prisma migrate dev --name <description>`. On ne touche jamais à `generated/`.
- **Noms dans l'API** : camelCase en français sans suffixe de table (`dateSortieFilm` en base devient `dateSortie` dans le JSON). Routes au pluriel et en minuscules.
- **Erreurs** : toujours le format `{ statut, code, message, details? }` avec les codes de la section 4 de la doc (`VALIDATION`, `NON_AUTHENTIFIE`, `INTERDIT`, `INTROUVABLE`, `CONFLIT`, `TROP_DE_REQUETES`, `ERREUR_SERVEUR`).
- **Données personnelles** : `nom`, `prenom` et `email` ne sortent que par `/api/membres/moi`. Le mot de passe haché ne sort jamais.
- **Sécurité** : `proxy.ts` ne suffit pas à protéger une route. Chaque `route.ts` protégée appelle elle-même `exigerMembre()` ou `exigerAdmin()`.
- **Secrets** : `TMDB_TOKEN` et `JWT_SECRET` restent dans `.env`, uniquement côté serveur. Ne jamais les préfixer par `NEXT_PUBLIC_`.
- **Segments d'URL** : dans Next.js, un segment fixe (`moi`) passe avant un segment dynamique (`[id]`). `/api/membres/moi` n'est donc jamais lu comme un identifiant.

## Où mettre…

| Je veux… | Fichier |
|---|---|
| Ajouter une page | `src/app/<chemin>/page.tsx` |
| Coder un endpoint | `src/app/api/<chemin>/route.ts`, en exportant `GET`, `POST`, etc. |
| Valider un formulaire ou un corps de requête | `src/validators/<domaine>.ts` |
| Écrire une requête en base | `src/services/<domaine>.service.ts` |
| Créer un composant réutilisable | `src/components/<domaine>/` |
| Modifier une table | `prisma/schema.prisma` + migration |
