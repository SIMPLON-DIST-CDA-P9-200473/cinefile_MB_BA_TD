-- DropForeignKey
ALTER TABLE "Liste" DROP CONSTRAINT "Liste_membreId_fkey";

-- DropForeignKey
ALTER TABLE "Contenir" DROP CONSTRAINT "Contenir_listeId_fkey";

-- DropForeignKey
ALTER TABLE "Signalement" DROP CONSTRAINT "Signalement_membreId_fkey";

-- DropForeignKey
ALTER TABLE "Signalement" DROP CONSTRAINT "Signalement_avisId_fkey";

-- DropForeignKey
ALTER TABLE "Avis" DROP CONSTRAINT "Avis_membreId_fkey";

-- DropForeignKey
ALTER TABLE "Historique" DROP CONSTRAINT "Historique_membreId_fkey";

-- DropForeignKey
ALTER TABLE "Suivre" DROP CONSTRAINT "Suivre_suiveurId_fkey";

-- DropForeignKey
ALTER TABLE "Suivre" DROP CONSTRAINT "Suivre_suiviId_fkey";

-- DropForeignKey
ALTER TABLE "Favori" DROP CONSTRAINT "Favori_membreId_fkey";

-- DropForeignKey
ALTER TABLE "Podium" DROP CONSTRAINT "Podium_membreId_fkey";

-- CreateIndex
CREATE UNIQUE INDEX "Contenir_listeId_positionFilmListe_key" ON "Contenir"("listeId", "positionFilmListe");

-- AddForeignKey
ALTER TABLE "Liste" ADD CONSTRAINT "Liste_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contenir" ADD CONSTRAINT "Contenir_listeId_fkey" FOREIGN KEY ("listeId") REFERENCES "Liste"("idListe") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Signalement" ADD CONSTRAINT "Signalement_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Signalement" ADD CONSTRAINT "Signalement_avisId_fkey" FOREIGN KEY ("avisId") REFERENCES "Avis"("idAvis") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avis" ADD CONSTRAINT "Avis_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Historique" ADD CONSTRAINT "Historique_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suivre" ADD CONSTRAINT "Suivre_suiveurId_fkey" FOREIGN KEY ("suiveurId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suivre" ADD CONSTRAINT "Suivre_suiviId_fkey" FOREIGN KEY ("suiviId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favori" ADD CONSTRAINT "Favori_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Podium" ADD CONSTRAINT "Podium_membreId_fkey" FOREIGN KEY ("membreId") REFERENCES "Membre"("id") ON DELETE CASCADE ON UPDATE CASCADE;


-- Contraintes non exprimables dans schema.prisma (doc API sections 6.4 et 6.6)

-- Un membre ne peut pas se suivre lui-même (POST /membres/{id}/abonnement → 400)
ALTER TABLE "Suivre" ADD CONSTRAINT "Suivre_pas_soi_meme_check" CHECK ("suiveurId" <> "suiviId");

-- Une seule liste par défaut (« À voir ») par membre
CREATE UNIQUE INDEX "Liste_une_par_defaut_par_membre_key" ON "Liste"("membreId") WHERE "parDefautListe" = true;
