🎬 CinéFile
Le cinéma se découvre, se partage et se vit ensemble.

CinéFile est un réseau social dédié aux passionnés de cinéma. Découvrez des films grâce à leurs bandes-annonces, trouvez où les regarder, partagez vos critiques, créez vos listes et suivez l'activité cinématographique de vos amis.

« Tu vois une bande-annonce, tu sais en un clic sur quelle plateforme la regarder, tu notes le film, et tes amis voient ce que tu en as pensé. »
📖 Présentation du projet

CinéFile est un projet de groupe réalisé dans le cadre de la formation Concepteur Développeur d'Applications (CDA).

Inspiré de plateformes comme Letterboxd, le projet reprend les fonctionnalités de journal cinématographique, de notation, de listes personnalisées et de suivi d'autres utilisateurs.

Notre objectif est d'aller plus loin en plaçant la bande-annonce et la disponibilité des films au centre de l'expérience.

L'application permettra notamment de :

Découvrir un catalogue de films.
Visionner les bandes-annonces directement depuis les fiches films.
Identifier les plateformes proposant un film en France.
Noter et rédiger des critiques.
Organiser ses films dans des listes personnalisées.
Suivre d'autres membres et consulter leur activité.

Contrairement à notre première application MovieApp, qui reposait sur 13 films enregistrés directement dans le code, CinéFile repart de zéro avec une véritable base de données et des données utilisateurs persistantes.

Le projet constitue ainsi une application Full-Stack reposant sur une architecture séparant le front-end, le back-end et la base de données.

✨ Fonctionnalités

Le développement est organisé autour d'un MVP (Minimum Viable Product) de 8 fonctionnalités principales.

🎞️ Découverte et films
Consultation d'un catalogue de films.
Recherche par titre.
Filtrage par genre.
Fiches détaillées pour chaque film.
Lecteur intégré pour les bandes-annonces YouTube.
Consultation des plateformes de disponibilité en France.
▶️ File « Lire ensuite »
Ajouter des films à regarder plus tard.
Enchaîner les bandes-annonces.
Organiser ses prochaines découvertes.
⭐ Avis et notation
Noter un film de 0,5 à 5 étoiles.
Rédiger une critique.
Consulter les avis des autres membres.
Modifier ou supprimer ses propres avis.
Un seul avis par film et par utilisateur.
📚 Listes personnalisées
Créer des listes de films.
Renommer et supprimer ses listes.
Ajouter ou retirer des films.
Réorganiser les films dans une liste.
👥 Réseau social
Créer un compte utilisateur.
Se connecter et se déconnecter.
Suivre ou ne plus suivre d'autres membres.
Consulter le fil d'activité des personnes suivies.
Découvrir les films appréciés par ses amis.
🚀 Évolutions envisagées (V2)
Profils publics enrichis.
Likes sur les avis et les listes.
Commentaires sur les critiques.
Journal de visionnage avec date.
Signalement et modération des avis.
Recommandations basées sur les notes des personnes suivies.
👤 Types d'utilisateurs
Profil	Fonctionnalités
Visiteur	Parcourir le catalogue, rechercher des films, regarder les bandes-annonces, consulter les plateformes et lire les avis publics.
Membre	Toutes les fonctionnalités visiteur, avec en plus la publication d'avis, la création de listes et le suivi d'autres membres.
Administrateur	Modérer les avis signalés, gérer les comptes et mettre à jour les fiches films.
🔄 Parcours utilisateur

Le parcours principal de l'application repose sur six étapes :

Découvrir : explorer les films tendance, rechercher un titre ou filtrer par genre.
Regarder : consulter une fiche film et visionner sa bande-annonce.
Trouver : identifier les plateformes proposant le film en France.
Partager : noter le film et rédiger une critique.
Organiser : ajouter le film à une liste personnalisée.
Échanger : suivre ses amis et découvrir leurs avis et leurs listes.

Ce parcours constitue également le fil conducteur de la démonstration finale du projet.

🏗️ Architecture technique

CinéFile repose sur une architecture en trois briques principales :

Brique	Technologie	Rôle
Front-end	React + TypeScript	Interface utilisateur et navigation
Back-end	Node.js	API REST et logique métier
Base de données	PostgreSQL	Stockage des comptes, avis, listes et films
Services externes
TMDB (The Movie Database) : récupération des informations des films, affiches, genres, bandes-annonces et plateformes de disponibilité.
YouTube : lecture des bandes-annonces intégrées aux fiches films.
JustWatch : source des données de disponibilité des plateformes, via TMDB.
Outils complémentaires envisagés
Tailwind CSS et daisyUI : interface et composants graphiques.
Zod : validation des données entrantes.
JWT : authentification.
bcrypt : hachage des mots de passe.
Vitest et Supertest : tests automatisés.
Postman : tests de l'API.
Git et GitHub : versionnement et collaboration.
Kanban : organisation des tâches.

Les choix techniques restent à valider avec le formateur.

🗄️ Gestion des données

Le projet distingue deux catégories de données.

Données provenant de TMDB
Titres et résumés des films.
Affiches et visuels.
Genres et années de sortie.
Bandes-annonces YouTube.
Plateformes de streaming disponibles en France.
Données propres à CinéFile
Comptes utilisateurs.
Avis et notes.
Listes personnalisées.
Relations entre abonnés et abonnements.
Films enregistrés dans les listes.
Fonctionnement de l'intégration TMDB

Le front-end ne communique jamais directement avec TMDB.

Lorsqu'un utilisateur consulte un film pour la première fois :

Le front-end effectue une requête vers notre API.
Le back-end interroge TMDB.
Les informations récupérées sont enregistrées dans notre base PostgreSQL.
Le back-end transmet les données au front-end.

Lors des consultations suivantes, les informations sont récupérées directement depuis notre base de données.

Cette approche permet de protéger la clé API TMDB et de conserver des relations cohérentes entre les films et les données créées par les utilisateurs.

🔐 Sécurité et bonnes pratiques

La sécurité et la gestion des données font partie intégrante du projet.

Mots de passe hachés avec bcrypt.
Authentification par jeton JWT.
Routes protégées selon les droits des utilisateurs.
Validation des données entrantes avec Zod.
Clé API TMDB stockée dans un fichier .env.
Fichier .env exclu du dépôt Git grâce au .gitignore.
Vérification des droits avant modification ou suppression des données.
Aucun mot de passe transmis dans les réponses de l'API.
📡 API REST

L'API sera organisée autour de plusieurs domaines fonctionnels.

Méthode	Route	Description
POST	/api/auth/register	Inscription
POST	/api/auth/login	Connexion
GET	/api/films	Catalogue et recherche
GET	/api/films/:id	Détails d'un film
GET	/api/films/:id/avis	Avis d'un film
POST	/api/films/:id/avis	Publier un avis
PUT	/api/avis/:id	Modifier un avis
DELETE	/api/avis/:id	Supprimer un avis
GET	/api/utilisateurs/:id/listes	Consulter les listes d'un membre
POST	/api/listes	Créer une liste
PUT	/api/listes/:id	Modifier une liste
DELETE	/api/listes/:id	Supprimer une liste
POST	/api/listes/:id/films	Ajouter un film à une liste
DELETE	/api/listes/:id/films/:filmId	Retirer un film d'une liste
POST	/api/utilisateurs/:id/suivre	Suivre un membre
DELETE	/api/utilisateurs/:id/suivre	Ne plus suivre un membre
GET	/api/fil	Consulter le fil d'activité

Cette liste constitue une première ébauche. Les routes seront précisées pendant la phase de conception.

🧩 Modélisation des données

La conception initiale du modèle de données repose sur 6 entités principales :

UTILISATEUR
FILM
AVIS
LISTE
GENRE
PLATEFORME

Les principales associations sont :

Un utilisateur suit d'autres utilisateurs.
Un utilisateur possède plusieurs listes.
Un utilisateur rédige des avis.
Un avis concerne un film.
Une liste contient plusieurs films.
Un film appartient à un ou plusieurs genres.
Un film est disponible sur différentes plateformes.

Les associations plusieurs-à-plusieurs seront notamment matérialisées par des tables dédiées dans PostgreSQL.

La modélisation suivra les étapes MERISE :

Dictionnaire de données.
MCD (Modèle Conceptuel de Données).
MLD (Modèle Logique de Données).
MPD (Modèle Physique de Données).
📅 Organisation du projet

Le développement est réparti sur quatre semaines.

Période	Objectifs
Semaine 1	Conception, cahier des charges, user stories, maquettes, MERISE, API et organisation Git.
Semaine 2	Développement back-end, base PostgreSQL, API REST et authentification.
Semaine 3	Développement front-end, navigation, formulaires et intégration de l'API.
Semaine 4	Tests, corrections, responsive design, accessibilité et préparation de la démonstration.
Organisation collaborative
Une branche Git par fonctionnalité.
Une Pull Request par contribution.
Relecture du code par un autre membre avant chaque fusion.
Un point d'équipe quotidien de 15 minutes.
Suivi des tâches via un tableau Kanban.

Le MVP reste prioritaire : les fonctionnalités V2 ne seront développées qu'une fois le périmètre initial terminé et testé.

⚙️ Installation et configuration

Les instructions détaillées d'installation seront ajoutées lors de la mise en place du front-end, du back-end et de la base de données.

Prérequis prévus
Node.js et npm.
PostgreSQL.
Git.
Une clé API TMDB.
Variables d'environnement

Les informations sensibles seront stockées dans un fichier .env, qui ne doit jamais être envoyé sur GitHub.

Exemple de configuration :

env
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/cinefile
TMDB_API_KEY=your_tmdb_api_key
JWT_SECRET=your_jwt_secret

⚠️ Conditions d'utilisation des données externes

Le projet utilise l'API TMDB dans un cadre pédagogique et non commercial.

Les conditions d'utilisation imposent notamment :

L'affichage du logo TMDB et de sa mention officielle.
L'affichage de la mention JustWatch à proximité des informations de disponibilité.
Le respect des conditions de conservation et d'actualisation des données.
L'utilisation des liens de disponibilité fournis par TMDB, sans créer de liens directs non autorisés vers les plateformes.

Mention officielle TMDB :

This website uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.

Sources :

TMDB – Documentation API
TMDB – Conditions d'utilisation
TMDB – Watch Providers
👨‍💻 Équipe projet

Projet collaboratif réalisé dans le cadre de la formation Concepteur Développeur d'Applications (CDA).

Membre	Rôle
À définir	Développement
À définir	Développement
À définir	Développement
🎯 Objectif final

Livrer une application Full-Stack fonctionnelle permettant aux passionnés de cinéma de découvrir des films, de partager leurs avis et de construire leur propre réseau cinématographique.

CinéFile — Découvrez, regardez, notez et partagez votre cinéma. 🍿