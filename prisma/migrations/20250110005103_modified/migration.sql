/*
  Warnings:

  - You are about to drop the column `available_seats` on the `Events` table. All the data in the column will be lost.
  - You are about to drop the column `event_info_id` on the `Events` table. All the data in the column will be lost.
  - You are about to drop the column `price_per_ticket` on the `Events` table. All the data in the column will be lost.
  - Added the required column `location` to the `EventInfo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price_per_ticket` to the `EventInfo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `EventInfo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "EventInfo" ADD COLUMN     "available_seats" TEXT[],
ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "price_per_ticket" INTEGER NOT NULL,
ADD COLUMN     "status" TEXT NOT NULL DEFAULT 'scheduled',
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Events" DROP COLUMN "available_seats",
DROP COLUMN "event_info_id",
DROP COLUMN "price_per_ticket",
ALTER COLUMN "description" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "EventInfo" ADD CONSTRAINT "EventInfo_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "Events"("event_id") ON DELETE RESTRICT ON UPDATE CASCADE;
