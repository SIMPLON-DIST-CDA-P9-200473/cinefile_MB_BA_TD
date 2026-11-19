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

# ⚙️ Installation

## Prérequis

- Node.js LTS
- npm
- PostgreSQL
- Git
- Clé API TMDB

## Installation

```bash
npm install
```

## Variables d'environnement

Créer un fichier `.env` :

```env
DATABASE_URL=postgresql://user:password@localhost:5432/cinefile

TMDB_API_KEY=your_tmdb_api_key

JWT_SECRET=your_jwt_secret
```

⚠️ Ne jamais publier le fichier `.env`.

Un fichier `.env.example` doit être fourni dans le dépôt.

## Lancement du projet

```bash
npm run dev
```

Application disponible sur :

```text
http://localhost:3000
```

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