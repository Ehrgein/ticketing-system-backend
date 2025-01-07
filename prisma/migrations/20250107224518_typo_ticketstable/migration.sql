/*
  Warnings:

  - You are about to drop the column `payer_first_name` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `payer_last_name` on the `Tickets` table. All the data in the column will be lost.
  - Added the required column `payer_firstName` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_lastName` to the `Tickets` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "ticket_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "event_time_id" INTEGER NOT NULL,
    "purchaser_id" INTEGER NOT NULL,
    "event_id" INTEGER NOT NULL,
    "location" INTEGER,
    "seat_location" TEXT NOT NULL,
    "price_per_ticket" INTEGER NOT NULL,
    "payer_email" TEXT NOT NULL,
    "payer_id" TEXT NOT NULL,
    "payer_firstName" TEXT NOT NULL,
    "payer_lastName" TEXT NOT NULL,
    "identification_num" TEXT NOT NULL,
    "identification_type" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "event_id", "event_time_id", "identification_num", "identification_type", "location", "payer_email", "payer_id", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt") SELECT "createdAt", "event_id", "event_time_id", "identification_num", "identification_type", "location", "payer_email", "payer_id", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
