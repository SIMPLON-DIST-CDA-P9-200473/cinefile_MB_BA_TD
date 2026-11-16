
# 🎬 CinéFile

> **Le cinéma se découvre, se regarde et se partage.**

CinéFile est un réseau social dédié aux passionnés de cinéma. Découvrez des films grâce à leurs bandes-annonces, trouvez où les regarder, partagez vos critiques et suivez l'activité de vos amis.

---

## 🍿 Présentation du projet

CinéFile est un projet de groupe réalisé dans le cadre de la formation **Concepteur Développeur d'Applications (CDA)**.

Inspiré de [Letterboxd](https://letterboxd.com/), le projet propose une plateforme qui rassemble toutes les étapes de l'expérience cinématographique : de la découverte d'un film jusqu'au partage de son avis.

### Notre concept

*Vous découvrez une bande-annonce, trouvez en un clic où regarder le film, partagez votre critique et découvrez ce qu'en pensent vos amis.*

Notre objectif est de créer une véritable expérience sociale autour du cinéma, en mettant les bandes-annonces, les plateformes de streaming et les interactions entre utilisateurs au centre de l'application.

---

## ✨ Fonctionnalités

Le développement est organisé autour d'un MVP (*Minimum Viable Product*) comprenant huit fonctionnalités principales.

### 🎞️ Découverte de films
- Consultation d'un catalogue de films.
- Recherche par titre.
- Filtrage par genre.
- Accès aux fiches détaillées des films.

### ▶️ Bandes-annonces
- Lecteur YouTube intégré aux fiches films.
- Consultation des bandes-annonces.
- File d'attente « Lire ensuite ».

### 📺 Disponibilité des films
- Consultation des plateformes disponibles en France.
- Distinction entre abonnement, location et achat.

### ⭐ Avis et notation
- Attribution d'une note de 0,5 à 5 étoiles.
- Rédaction de critiques.
- Modification et suppression de ses propres avis.
- Consultation des avis publics.

### 📚 Listes personnalisées
- Création de listes de films.
- Ajout et suppression de films.
- Modification et suppression des listes.
- Réorganisation des films.

### 👥 Réseau social
- Inscription et authentification.
- Suivi d'autres membres.
- Consultation du fil d'activité.
- Découverte des avis et des listes des membres suivis.

### 🔮 Évolutions envisagées (V2)
- Profils publics enrichis.
- Likes sur les avis et les listes.
- Commentaires sur les critiques.
- Journal personnel de visionnage.
- Signalement et modération des avis.
- Recommandations personnalisées.

---

## 🛠️ Stack technique

### Front-end

| Technologie | Utilisation |
|---|---|
| Next.js | Framework React et gestion des routes |
| React | Construction des interfaces |
| TypeScript | Typage statique |
| Tailwind CSS | Mise en forme |
| daisyUI | Bibliothèque de composants |

### Back-end

| Technologie | Utilisation |
|---|---|
| Next.js | Routes API et logique serveur |
| Node.js | Environnement d'exécution |
| Zod | Validation des données |
| JWT | Authentification par jetons |
| bcrypt | Hachage des mots de passe |

### Base de données

| Technologie | Utilisation |
|---|---|
| PostgreSQL | Stockage des données relationnelles |

### Tests et outils

- Vitest : tests unitaires.
- Supertest : tests des routes HTTP.
- Postman : tests de l'API.
- Git et GitHub : versionnement et collaboration.
- Kanban : organisation du projet.

---

## 🏗️ Architecture du projet

CinéFile s'appuie sur Next.js pour réunir le front-end et la logique back-end dans une même application.

L'architecture repose sur trois composants principaux :

1. **Front-end Next.js / React** : affichage des pages, navigation et interactions utilisateur.
2. **Back-end Next.js** : routes API, authentification, logique métier et communication avec les services externes.
3. **PostgreSQL** : stockage des utilisateurs, films, avis, listes et abonnements.

Les services externes TMDB et YouTube complètent cette architecture.

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

## 🌐 Sources de données

### TMDB – The Movie Database

CinéFile utilise principalement l'API [TMDB](https://www.themoviedb.org/) pour récupérer les informations cinématographiques :

- Titres, résumés et dates de sortie.
- Affiches et genres.
- Bandes-annonces YouTube.
- Plateformes de disponibilité en France.

### YouTube

Les bandes-annonces sont intégrées directement aux fiches films grâce au lecteur YouTube.

### JustWatch

Les informations de disponibilité proviennent de JustWatch via TMDB :

- Abonnement.
- Location.
- Achat.

### Gestion des données

Le front-end communique exclusivement avec notre back-end Next.js.

Lorsqu'un film est consulté pour la première fois :

1. Le back-end interroge TMDB.
2. Les informations récupérées sont enregistrées dans PostgreSQL.
3. Les données sont transmises au front-end.

Les consultations suivantes utilisent les données enregistrées dans notre base.

Cette architecture permet de protéger la clé API TMDB et de relier les films aux données créées par les utilisateurs.

---

## 🗄️ Modélisation des données

La conception initiale repose sur **six entités principales** :

- `UTILISATEUR`
- `FILM`
- `AVIS`
- `LISTE`
- `GENRE`
- `PLATEFORME`

Les associations permettent notamment de gérer :

- Les abonnements entre utilisateurs.
- Les avis associés aux films.
- Les listes personnalisées.
- Les genres des films.
- Les plateformes de disponibilité.

La conception de la base de données suit la méthode **MERISE** :

1. Dictionnaire de données.
2. MCD – Modèle Conceptuel de Données.
3. MLD – Modèle Logique de Données.
4. MPD – Modèle Physique de Données.

---

## 🔐 Sécurité

La sécurité fait partie intégrante du développement :

- Hachage des mots de passe avec bcrypt.
- Authentification sécurisée.
- Protection des routes selon les permissions.
- Validation des données entrantes avec Zod.
- Variables sensibles stockées dans un fichier `.env`.
- Clé API TMDB utilisée exclusivement côté serveur.
- Vérification des droits avant modification ou suppression des données.

---

## 📅 Organisation du projet

Le développement est réparti sur quatre semaines.

| Période | Objectifs |
|---|---|
| **Semaine 1** | Conception, cahier des charges, user stories, maquettes et MERISE |
| **Semaine 2** | Base PostgreSQL, back-end Next.js, API et authentification |
| **Semaine 3** | Développement des interfaces et intégration du back-end |
| **Semaine 4** | Tests, corrections, responsive design et démonstration finale |

### Organisation collaborative

- Une branche Git par fonctionnalité.
- Une Pull Request avant chaque fusion.
- Relecture du code par un autre membre.
- Un point d'équipe quotidien.
- Suivi du travail avec un tableau Kanban.

Le MVP reste prioritaire. Les fonctionnalités V2 ne seront développées qu'une fois les fonctionnalités principales terminées et testées.

---

## ⚙️ Installation

Les instructions détaillées seront complétées lors de la mise en place du projet.

### Prérequis

- Node.js (version LTS).
- npm.
- PostgreSQL.
- Git.
- Une clé API TMDB.

### Installation des dépendances

```bash
npm install
```

### Configuration des variables d'environnement

Créer un fichier `.env` à la racine du projet :

```env
DATABASE_URL=postgresql://user:password@localhost:5432/cinefile
TMDB_API_KEY=your_tmdb_api_key
JWT_SECRET=your_jwt_secret
```

**Important :** le fichier `.env` ne doit jamais être envoyé sur GitHub. Un fichier `.env.example` sera fourni pour documenter les variables nécessaires.

### Lancement du projet

```bash
npm run dev
```

L'application sera accessible à l'adresse :

http://localhost:3000

---

## ⚖️ Crédits et attribution

Ce projet utilise les données et services de TMDB à des fins pédagogiques et non commerciales.

Mention officielle :

> This website uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.

Les données de disponibilité sont fournies par JustWatch via TMDB.

Documentation :
- [Documentation TMDB API](https://developer.themoviedb.org/docs)
- [Conditions d'utilisation TMDB](https://www.themoviedb.org/api-terms-of-use)
- [TMDB Watch Providers](https://developer.themoviedb.org/reference/movie-watch-providers)

---

## 👨‍💻 Équipe projet

Projet collaboratif réalisé dans le cadre de la formation **Concepteur Développeur d'Applications (CDA)**.

| Membre | Contribution |
|---|---|
| À définir | Développement |
| À définir | Développement |
| À définir | Développement |

---

<div align="center">

**🎬 CinéFile**

*Le cinéma est encore meilleur quand il se partage.*

**Découvrez · Regardez · Notez · Partagez**

</div>
