-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Membre" (
    "id" SERIAL NOT NULL,
    "pseudo" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "motDePasse" TEXT NOT NULL,
    "avatar" TEXT,
    "dateInscription" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "biographie" TEXT,
    "roleId" INTEGER NOT NULL,

    CONSTRAINT "Membre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Film" (
    "idFilm" SERIAL NOT NULL,
    "idTmdbFilm" INTEGER NOT NULL,
    "titreFilm" TEXT NOT NULL,
    "dateSortieFilm" TIMESTAMP(3) NOT NULL,
    "resumeFilm" TEXT NOT NULL,
    "bandeAnnonceFilm" TEXT,
    "afficheFilm" TEXT NOT NULL,

    CONSTRAINT "Film_pkey" PRIMARY KEY ("idFilm")
);

-- CreateTable
CREATE TABLE "Liste" (
    "idListe" SERIAL NOT NULL,
    "nomListe" TEXT NOT NULL,
    "visibiliteListe" BOOLEAN NOT NULL DEFAULT true,
    "parDefautListe" BOOLEAN NOT NULL DEFAULT false,
    "dateCreationListe" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "membreId" INTEGER NOT NULL,

    CONSTRAINT "Liste_pkey" PRIMARY KEY ("idListe")
);

-- CreateTable
CREATE TABLE "Contenir" (
    "listeId" INTEGER NOT NULL,
    "filmId" INTEGER NOT NULL,
    "positionFilmListe" INTEGER NOT NULL,
    "dateAjoutListe" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Contenir_pkey" PRIMARY KEY ("listeId","filmId")
);

-- CreateTable
CREATE TABLE "Signalement" (
    "idSignalement" SERIAL NOT NULL,
    "motifSignalement" TEXT NOT NULL,
    "dateSignalement" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "statutSignalement" TEXT NOT NULL DEFAULT 'en attente',
    "membreId" INTEGER NOT NULL,
    "avisId" INTEGER NOT NULL,

    CONSTRAINT "Signalement_pkey" PRIMARY KEY ("idSignalement")
);

-- CreateTable
CREATE TABLE "Genre" (
    "idGenre" SERIAL NOT NULL,
    "nomGenre" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("idGenre")
);

-- CreateTable
CREATE TABLE "Plateforme" (
    "idPlateforme" SERIAL NOT NULL,
    "idTmdbPlateforme" INTEGER NOT NULL,
    "nomPlateforme" TEXT NOT NULL,
    "logoPlateforme" TEXT NOT NULL,

    CONSTRAINT "Plateforme_pkey" PRIMARY KEY ("idPlateforme")
);

-- CreateTable
CREATE TABLE "Acteur" (
    "idActeur" SERIAL NOT NULL,
    "idTmdbActeur" INTEGER NOT NULL,
    "nomActeur" TEXT NOT NULL,
    "imageActeur" TEXT,

    CONSTRAINT "Acteur_pkey" PRIMARY KEY ("idActeur")
);

-- CreateTable
CREATE TABLE "Realisateur" (
    "idRealisateur" SERIAL NOT NULL,
    "idTmdbRealisateur" INTEGER NOT NULL,
    "nomRealisateur" TEXT NOT NULL,
    "imageRealisateur" TEXT,

    CONSTRAINT "Realisateur_pkey" PRIMARY KEY ("idRealisateur")
);

-- CreateTable
CREATE TABLE "FilmActeur" (
    "filmId" INTEGER NOT NULL,
    "acteurId" INTEGER NOT NULL,

    CONSTRAINT "FilmActeur_pkey" PRIMARY KEY ("filmId","acteurId")
);

-- CreateTable
CREATE TABLE "FilmRealisateur" (
    "filmId" INTEGER NOT NULL,
    "realisateurId" INTEGER NOT NULL,

    CONSTRAINT "FilmRealisateur_pkey" PRIMARY KEY ("filmId","realisateurId")
);

-- CreateTable
CREATE TABLE "Avis" (
    "idAvis" SERIAL NOT NULL,
    "noteAvis" DOUBLE PRECISION NOT NULL,
    "critiqueAvis" TEXT,
    "dateCreationAvis" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateModificationAvis" TIMESTAMP(3),
    "masqueAvis" BOOLEAN NOT NULL DEFAULT false,
    "membreId" INTEGER NOT NULL,
    "filmId" INTEGER NOT NULL,

    CONSTRAINT "Avis_pkey" PRIMARY KEY ("idAvis")
);

-- CreateTable
CREATE TABLE "Appartenir" (
    "filmId" INTEGER NOT NULL,
    "genreId" INTEGER NOT NULL,

    CONSTRAINT "Appartenir_pkey" PRIMARY KEY ("filmId","genreId")
);

-- CreateTable
CREATE TABLE "EtreDisponible" (
    "filmId" INTEGER NOT NULL,
    "plateformeId" INTEGER NOT NULL,
    "typeOffre" TEXT NOT NULL,

    CONSTRAINT "EtreDisponible_pkey" PRIMARY KEY ("filmId","plateformeId","typeOffre")
);

-- CreateTable
CREATE TABLE "Historique" (
    "idHistorique" SERIAL NOT NULL,
    "dateVisionnage" TIMESTAMP(3) NOT NULL,
    "membreId" INTEGER NOT NULL,
    "filmId" INTEGER NOT NULL,

    CONSTRAINT "Historique_pkey" PRIMARY KEY ("idHistorique")
);

-- CreateTable
CREATE TABLE "Suivre" (
    "suiveurId" INTEGER NOT NULL,
    "suiviId" INTEGER NOT NULL,
    "dateSuivi" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Suivre_pkey" PRIMARY KEY ("suiveurId","suiviId")
);

-- CreateTable
CREATE TABLE "Favori" (
    "membreId" INTEGER NOT NULL,
    "filmId" INTEGER NOT NULL,
    "dateAjoutFavori" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Favori_pkey" PRIMARY KEY ("membreId","filmId")
);

-- CreateTable
CREATE TABLE "Podium" (
    "membreId" INTEGER NOT NULL,
    "filmId" INTEGER NOT NULL,
    "rangPodium" INTEGER NOT NULL,

    CONSTRAINT "Podium_pkey" PRIMARY KEY ("membreId","rangPodium")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_nom_key" ON "Role"("nom");

-- CreateIndex
CREATE UNIQUE INDEX "Membre_pseudo_key" ON "Membre"("pseudo");

-- CreateIndex
CREATE UNIQUE INDEX "Membre_email_key" ON "Membre"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Film_idTmdbFilm_key" ON "Film"("idTmdbFilm");

-- CreateIndex
CREATE UNIQUE INDEX "Genre_nomGenre_key" ON "Genre"("nomGenre");

-- CreateIndex
CREATE UNIQUE INDEX "Plateforme_idTmdbPlateforme_key" ON "Plateforme"("idTmdbPlateforme");

-- CreateIndex
CREATE UNIQUE INDEX "Plateforme_nomPlateforme_key" ON "Plateforme"("nomPlateforme");

-- CreateIndex
CREATE UNIQUE INDEX "Acteur_idTmdbActeur_key" ON "Acteur"("idTmdbActeur");

-- CreateIndex
CREATE UNIQUE INDEX "Realisateur_idTmdbRealisateur_key" ON "Realisateur"("idTmdbRealisateur");

-- CreateIndex
CREATE UNIQUE INDEX "Avis_membreId_filmId_key" ON "Avis"("membreId", "filmId");

-- AddForeignKey
ALTER TABLE "Membre" ADD CONSTRAINT "Membre_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Liste" ADD CONSTRAINT "Liste_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contenir" ADD CONSTRAINT "Contenir_listeId_fkey" FOREIGN KEY ("listeId") REFERENCES "Liste"("idListe") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contenir" ADD CONSTRAINT "Contenir_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Signalement" ADD CONSTRAINT "Signalement_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Signalement" ADD CONSTRAINT "Signalement_avisId_fkey" FOREIGN KEY ("avisId") REFERENCES "Avis"("idAvis") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilmActeur" ADD CONSTRAINT "FilmActeur_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilmActeur" ADD CONSTRAINT "FilmActeur_acteurId_fkey" FOREIGN KEY ("acteurId") REFERENCES "Acteur"("idActeur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilmRealisateur" ADD CONSTRAINT "FilmRealisateur_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilmRealisateur" ADD CONSTRAINT "FilmRealisateur_realisateurId_fkey" FOREIGN KEY ("realisateurId") REFERENCES "Realisateur"("idRealisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avis" ADD CONSTRAINT "Avis_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avis" ADD CONSTRAINT "Avis_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appartenir" ADD CONSTRAINT "Appartenir_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appartenir" ADD CONSTRAINT "Appartenir_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES "Genre"("idGenre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EtreDisponible" ADD CONSTRAINT "EtreDisponible_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EtreDisponible" ADD CONSTRAINT "EtreDisponible_plateformeId_fkey" FOREIGN KEY ("plateformeId") REFERENCES "Plateforme"("idPlateforme") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Historique" ADD CONSTRAINT "Historique_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Historique" ADD CONSTRAINT "Historique_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suivre" ADD CONSTRAINT "Suivre_suiveurId_fkey" FOREIGN KEY ("suiveurId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suivre" ADD CONSTRAINT "Suivre_suiviId_fkey" FOREIGN KEY ("suiviId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favori" ADD CONSTRAINT "Favori_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favori" ADD CONSTRAINT "Favori_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Podium" ADD CONSTRAINT "Podium_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Podium" ADD CONSTRAINT "Podium_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Film"("idFilm") ON DELETE RESTRICT ON UPDATE CASCADE;
