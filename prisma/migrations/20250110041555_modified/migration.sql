/*
  Warnings:

  - You are about to drop the column `available_seats` on the `EventInfo` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "EventInfo" DROP COLUMN "available_seats",
ADD COLUMN     "ticket_availability" INTEGER NOT NULL DEFAULT 0;
