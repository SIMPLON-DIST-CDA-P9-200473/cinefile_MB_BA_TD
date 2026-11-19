# 🎬 CinéFile

## Le cinéma se découvre, se regarde et se partage.

CinéFile est un réseau social dédié aux passionnés de cinéma. Découvrez des films grâce à leurs bandes-annonces, trouvez où les regarder, partagez vos critiques et suivez l'activité de vos amis.

---

# 🍿 Présentation du projet

CinéFile est un projet de groupe réalisé dans le cadre de la formation **Concepteur Développeur d'Applications (CDA)**.

Inspiré de **Letterboxd**, le projet propose une plateforme qui rassemble toutes les étapes de l'expérience cinématographique : de la découverte d'un film jusqu'au partage de son avis.

## Notre concept

> Vous découvrez une bande-annonce, trouvez en un clic où regarder le film, partagez votre critique et découvrez ce qu'en pensent vos amis.

Notre objectif est de créer une véritable expérience sociale autour du cinéma en mettant les bandes-annonces, les plateformes de streaming et les interactions entre utilisateurs au centre de l'application.

---

# 📸 Aperçu de l'application

🚧 Captures d'écran à venir

- Accueil
- Fiche film
- Profil utilisateur
- Fil d'activité
- Gestion des listes

---

# ✨ Fonctionnalités

Le MVP est organisé autour de six grands domaines fonctionnels.

## 🎞️ Découverte de films

- Consultation d'un catalogue de films
- Recherche par titre
- Filtrage par genre
- Accès aux fiches détaillées des films

## ▶️ Bandes-annonces

- Lecteur YouTube intégré
- Consultation des bandes-annonces
- File d'attente « Lire ensuite »

## 📺 Disponibilité des films

- Consultation des plateformes disponibles en France
- Distinction entre abonnement, location et achat

## ⭐ Avis et notation

- Attribution d'une note de 0,5 à 5 étoiles
- Rédaction de critiques
- Modification de ses avis
- Suppression de ses avis
- Consultation des avis publics

## 📚 Listes personnalisées

- Création de listes
- Ajout de films
- Suppression de films
- Modification des listes
- Suppression des listes
- Réorganisation des films

## 👥 Réseau social

- Inscription et authentification
- Suivi d'autres membres
- Consultation du fil d'activité
- Consultation des profils publics
- Découverte des avis et listes des membres suivis

---

# 🔮 Évolutions envisagées (V2)

- Profils publics enrichis
- Likes sur les avis et les listes
- Commentaires sur les critiques
- Journal personnel de visionnage
- Signalement et modération des avis
- Recommandations personnalisées

---

# 🛠️ Stack technique

## Front-end

| Technologie | Utilisation |
|------------|------------|
| Next.js | Framework React et routage |
| React | Construction des interfaces |
| TypeScript | Typage statique |
| Tailwind CSS | Mise en forme |
| daisyUI | Bibliothèque de composants |

## Back-end

| Technologie | Utilisation |
|------------|------------|
| Next.js API Routes | Routes API et logique serveur |
| Node.js | Environnement d'exécution |
| Zod | Validation des données |
| JWT | Authentification |
| bcrypt | Hachage des mots de passe |

## Base de données

| Technologie | Utilisation |
|------------|------------|
| PostgreSQL | Stockage des données relationnelles |

## Tests et outils

- Vitest
- Supertest
- Postman
- Git
- GitHub
- Kanban

---

# 🏗️ Architecture du projet

CinéFile s'appuie sur Next.js pour réunir le front-end et la logique back-end dans une même application.

L'architecture repose sur trois composants principaux :

1. **Front-end Next.js / React**
   - Affichage des pages
   - Navigation
   - Interactions utilisateur

2. **Back-end Next.js**
   - Routes API
   - Authentification
   - Logique métier
   - Communication avec les services externes

3. **PostgreSQL**
   - Stockage des utilisateurs
   - Films
   - Avis
   - Listes
   - Réseau social

Les services externes **TMDB** et **YouTube** complètent cette architecture.

```text
CinéFile
│
├── Front-end
│   ├── Next.js
│   ├── React
│   ├── TypeScript
│   └── Tailwind CSS
│
├── Back-end
│   ├── Next.js API Routes
│   ├── Authentification
│   ├── Logique métier
│   └── Intégration TMDB
│
├── Base de données
│   └── PostgreSQL
│
└── Services externes
    ├── TMDB
    └── YouTube
```

---

# 🌐 Sources de données

## TMDB – The Movie Database

CinéFile utilise l'API TMDB pour :

- Les titres
- Les résumés
- Les dates de sortie
- Les affiches
- Les genres
- Les bandes-annonces
- Les informations de disponibilité

## YouTube

Les bandes-annonces sont affichées directement dans les fiches des films grâce au lecteur YouTube intégré.

## JustWatch

Les données de disponibilité proviennent de JustWatch via TMDB :

- Abonnement
- Location
- Achat

## Gestion des données

Le front-end communique exclusivement avec notre API Next.js.

Lorsqu'un administrateur importe ou synchronise un film :

1. Le back-end interroge TMDB.
2. Les informations sont enregistrées dans PostgreSQL.
3. Les données sont ensuite servies aux utilisateurs.

Les consultations des membres utilisent uniquement les données stockées dans la base de données.

Cette architecture permet :

- De protéger la clé API TMDB
- D'améliorer les performances
- De relier les films aux données créées par les utilisateurs

---

# 🗄️ Modélisation des données

La conception repose notamment sur les entités suivantes :

- MEMBRE
- FILM
- AVIS
- LISTE
- GENRE
- PLATEFORME
- ACTEUR
- RÉALISATEUR
- ROLE

Les associations permettent de gérer :

- Les abonnements entre membres
- Les avis sur les films
- Les listes personnalisées
- Les genres
- Les plateformes de diffusion
- Les acteurs et réalisateurs

La modélisation suit la méthode **MERISE** :

1. Dictionnaire de données
2. MCD
3. MLD
4. MPD

---

# 🔐 Sécurité

La sécurité fait partie intégrante du développement :

- Hachage des mots de passe avec bcrypt
- Authentification JWT
- JWT stocké dans un cookie HttpOnly sécurisé
- Protection des routes selon les rôles
- Validation des données avec Zod
- Protection contre les injections SQL
- Protection contre les attaques XSS
- Variables sensibles stockées dans `.env`
- Clé TMDB utilisée exclusivement côté serveur
- Vérification des droits avant chaque modification ou suppression

---

# 📅 Organisation du projet

| Période | Objectifs |
|----------|----------|
| Semaine 1 | Conception, cahier des charges, maquettes et MERISE |
| Semaine 2 | PostgreSQL, API et authentification |
| Semaine 3 | Développement des interfaces |
| Semaine 4 | Tests, responsive et démonstration |

## Organisation collaborative

- Une branche Git par fonctionnalité
- Une Pull Request avant chaque fusion
- Relecture du code par un autre membre
- Point quotidien d'équipe
- Suivi via Kanban

---

# 🚀 État du projet

✅ Cahier des charges terminé

✅ User stories terminées

✅ Maquettes terminées

✅ MERISE terminée

✅ Documentation API terminée

🚧 Développement en cours

---

# ⚙️ Démarrer le projet

L'application, la base PostgreSQL et les migrations tournent dans Docker : pas besoin d'installer PostgreSQL sur sa machine.

## Prérequis

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installé **et lancé**
- Git
- Node.js LTS et npm (seulement pour coder en local, voir plus bas)

## Premier lancement

Depuis la racine du dépôt :

```bash
git clone https://github.com/SIMPLON-DIST-CDA-P9-200473/cinefile_MB_BA_TD.git
cd cinefile_MB_BA_TD
cp .env.example .env
docker compose up --build
```

Docker démarre trois services, dans cet ordre :

| Service | Rôle |
|---------|------|
| `db` | PostgreSQL 18, accessible aussi depuis la machine sur `localhost:5432` |
| `migrate` | Applique les migrations Prisma, puis s'arrête |
| `app` | L'application Next.js |

Application disponible sur [http://localhost:3000](http://localhost:3000).

## Variables d'environnement

Chaque membre crée son propre `.env` à partir de `.env.example`. Le `.env` est ignoré par git : **ne jamais le commiter**.

| Variable | Rôle |
|----------|------|
| `DATABASE_URL` | Connexion PostgreSQL (dans Docker, l'hôte est `db`) |
| `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB` | Identifiants de la base créée par Docker |
| `JWT_SECRET` | Clé de signature des JWT. Générer une valeur avec `openssl rand -base64 32` |
| `TMDB_TOKEN` | Jeton d'accès TMDB (Bearer), uniquement côté serveur |

Les vrais secrets (jeton TMDB…) se partagent entre nous hors de git.

## Commandes utiles

```bash
docker compose up --build   # tout lancer (à refaire après un pull)
docker compose up -d db     # lancer seulement la base
docker compose down         # tout arrêter (les données sont conservées)
docker compose down -v      # tout arrêter ET effacer la base
docker compose logs -f app  # suivre les logs de l'application
```

Après un `git pull` qui modifie le code ou ajoute une migration, relancer `docker compose up --build` : les migrations s'appliquent automatiquement.

## Coder en local (rechargement à chaud)

L'image Docker sert à faire tourner l'application comme en production : elle ne se recharge pas quand on modifie le code. Pour développer, on garde seulement la base dans Docker :

```bash
docker compose up -d db
cd cinefile
cp ../.env.example .env     # puis remplacer @db: par @localhost: dans DATABASE_URL
npm install
npx prisma migrate dev      # applique les migrations sur la base locale
npm run dev
```

Next.js et Prisma lisent le `.env` situé dans `cinefile/`, d'où ce deuxième fichier.

## Modifier la base de données

1. Modifier `cinefile/prisma/schema.prisma`
2. `npx prisma migrate dev --name description-du-changement` (depuis `cinefile/`)
3. Commiter le schéma **et** le dossier de migration créé dans `prisma/migrations/`

Ne jamais modifier une migration déjà poussée, ni les fichiers de `cinefile/generated/`.

## Organisation du code

L'arborescence de `cinefile/src/` et le rôle de chaque dossier sont décrits dans [cinefile/docs/ARCHITECTURE.md](cinefile/docs/ARCHITECTURE.md).

---

# ⚖️ Crédits et attribution

Ce projet utilise les données et services de TMDB à des fins pédagogiques et non commerciales.

Mention obligatoire :

> This website uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.

Les informations de disponibilité sont fournies par JustWatch via TMDB.

---

# 📚 Documentation

- Documentation TMDB API
- Conditions d'utilisation TMDB
- Documentation Watch Providers TMDB

---

# 👨‍💻 Équipe projet

Projet collaboratif réalisé dans le cadre de la formation **Concepteur Développeur d'Applications (CDA)**.

| Membre | Contribution |
|---------|-------------|
| Mathieu | Développement |
| Béni | Développement |
| Thibault | Développement |

---

# 🎬 CinéFile

*Le cinéma est encore meilleur quand il se partage.*

**Découvrez · Regardez · Notez · Partagez**