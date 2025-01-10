/*
  Warnings:

  - You are about to drop the `EventTimes` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `event_info_id` to the `Events` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price_per_ticket` to the `Events` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Events" ADD COLUMN     "available_seats" TEXT[],
ADD COLUMN     "event_info_id" INTEGER NOT NULL,
ADD COLUMN     "price_per_ticket" INTEGER NOT NULL;

-- DropTable
DROP TABLE "EventTimes";

-- CreateTable
CREATE TABLE "EventInfo" (
    "event_info_id" SERIAL NOT NULL,
    "event_id" INTEGER NOT NULL,
    "datetime" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EventInfo_pkey" PRIMARY KEY ("event_info_id")
);
