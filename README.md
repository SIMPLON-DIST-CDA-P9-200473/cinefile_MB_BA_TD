🎬 CinéFile
Le cinéma se découvre, se regarde et se partage.

CinéFile est un réseau social dédié aux passionnés de cinéma. Découvrez des films, visionnez leurs bandes-annonces, trouvez où les regarder, partagez vos critiques et suivez l'activité de vos amis.

Présentation

Réalisé dans le cadre d'un projet de groupe en formation Concepteur Développeur d'Applications (CDA), CinéFile s'inspire de Letterboxd et des réseaux sociaux dédiés au cinéma.

L'objectif est de proposer une plateforme qui rassemble toutes les étapes de l'expérience cinématographique : de la découverte d'un film jusqu'au partage de son avis.

Le concept en une phrase :

Vous découvrez une bande-annonce, trouvez en un clic où regarder le film, partagez votre critique et découvrez ce qu'en pensent vos amis.

Fonctionnalités

Le projet est organisé autour d'un MVP (Minimum Viable Product) comprenant huit fonctionnalités principales.

Découvrir des films
Consulter un catalogue de films.
Rechercher un film par son titre.
Filtrer les résultats par genre.
Accéder à une fiche détaillée pour chaque film.
Regarder des bandes-annonces
Visionner les bandes-annonces directement depuis les fiches films.
Intégrer un lecteur YouTube.
Ajouter des bandes-annonces à une file « Lire ensuite ».
Trouver où regarder un film
Consulter les plateformes disponibles en France.
Distinguer les offres par abonnement, location et achat.
Partager ses avis
Attribuer une note de 0,5 à 5 étoiles.
Rédiger une critique.
Modifier ou supprimer son propre avis.
Consulter les avis des autres membres.
Organiser ses films
Créer des listes personnalisées.
Ajouter et retirer des films.
Renommer et supprimer ses listes.
Réorganiser les films dans ses collections.
Suivre ses amis
Créer un compte et gérer son profil.
Suivre ou ne plus suivre d'autres membres.
Consulter leur activité.
Découvrir leurs avis et leurs listes.
Évolutions envisagées

Une fois le MVP terminé et testé, plusieurs fonctionnalités pourront enrichir l'application :

Profils publics détaillés.
Likes sur les avis et les listes.
Commentaires sur les critiques.
Journal personnel de visionnage.
Signalement et modération des avis.
Recommandations personnalisées.
Technologies

Les technologies envisagées pour le développement sont les suivantes :

Front-end

React
TypeScript
Tailwind CSS
daisyUI

Back-end

Node.js
API REST
JWT pour l'authentification
Zod pour la validation des données
bcrypt pour le hachage des mots de passe

Base de données

PostgreSQL

Tests et outils

Vitest
Supertest
Postman
Git et GitHub
Kanban

La stack technique reste à valider avec le formateur.

Sources de données

CinéFile utilise principalement l'API TMDB (The Movie Database) pour récupérer les informations cinématographiques.

Les données utilisées comprennent :

Titres, résumés et dates de sortie.
Affiches et genres.
Bandes-annonces YouTube.
Plateformes de disponibilité en France.

Les bandes-annonces sont lues via le lecteur YouTube intégré.

Les informations de disponibilité proviennent de JustWatch via TMDB et sont réparties en trois catégories :

Abonnement.
Location.
Achat.
Gestion des données

Le front-end communique exclusivement avec notre propre API.

Lorsqu'un film est consulté pour la première fois, le back-end récupère ses informations depuis TMDB, les enregistre dans PostgreSQL puis les transmet au front-end.

Les consultations suivantes utilisent les données enregistrées dans notre base.

Cette architecture permet de protéger la clé API et de relier les films aux données créées par les utilisateurs.

Architecture

Le projet repose sur trois composants principaux :

Front-end : interface utilisateur développée avec React et TypeScript.
Back-end : API REST développée avec Node.js.
Base de données : PostgreSQL pour stocker les comptes, les avis, les listes et les données cinématographiques mises en cache.
Modélisation des données

La conception initiale repose sur six entités principales :

UTILISATEUR
FILM
AVIS
LISTE
GENRE
PLATEFORME

Les associations permettent notamment de gérer les abonnements entre utilisateurs, les avis, les listes de films, les genres et les plateformes de disponibilité.

La conception de la base de données suit la méthode MERISE :

Dictionnaire de données.
MCD (Modèle Conceptuel de Données).
MLD (Modèle Logique de Données).
MPD (Modèle Physique de Données).
Sécurité

Plusieurs bonnes pratiques sont prévues dès la conception :

Hachage des mots de passe avec bcrypt.
Authentification avec JWT.
Protection des routes selon les permissions.
Validation des données entrantes.
Stockage des informations sensibles dans un fichier .env.
Exclusion des fichiers sensibles du dépôt Git.
Organisation du projet

Le développement est réparti sur quatre semaines :

Semaine 1 – Conception

Cahier des charges et user stories.
Maquettes des interfaces.
Modélisation MERISE.
Définition des routes API.
Mise en place du dépôt Git et du Kanban.

Semaine 2 – Back-end

Création de la base PostgreSQL.
Développement de l'API REST.
Authentification et validation.
Tests des routes avec Postman.

Semaine 3 – Front-end

Développement des interfaces.
Navigation et formulaires.
Connexion à l'API.
Gestion des états de chargement et des erreurs.

Semaine 4 – Qualité

Tests automatisés.
Corrections et améliorations.
Responsive design et accessibilité.
Préparation de la démonstration finale.
Organisation collaborative
Une branche Git par fonctionnalité.
Une Pull Request avant chaque fusion.
Relecture du code par un autre membre.
Un point d'équipe quotidien.
Suivi du travail avec un tableau Kanban.
Installation

Les instructions d'installation seront complétées lors de la mise en place de l'architecture technique.

Prérequis prévus :

Node.js et npm.
PostgreSQL.
Git.
Une clé API TMDB.

Les variables d'environnement seront documentées dans un fichier .env.example. Le fichier .env contenant les véritables secrets ne sera jamais versionné.

Crédits

Ce projet utilise les données et les services de TMDB à des fins pédagogiques et non commerciales.

Les conditions d'utilisation de TMDB imposent notamment l'affichage de son logo et de la mention suivante :

This website uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.

Les données de disponibilité sont fournies par JustWatch via TMDB.

Documentation :

TMDB API
TMDB API Terms of Use
TMDB Watch Providers
Équipe

Projet collaboratif réalisé dans le cadre de la formation Concepteur Développeur d'Applications (CDA).

Les membres et leurs contributions seront renseignés au fur et à mesure du développement.

CinéFile — Le cinéma est encore meilleur quand il se partage. 🎬
