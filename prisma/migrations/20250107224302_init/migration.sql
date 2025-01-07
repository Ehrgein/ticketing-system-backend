/*
  Warnings:

  - Added the required column `identification_num` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `identification_type` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_email` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_first_name` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_id` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_last_name` to the `Tickets` table without a default value. This is not possible if the table is not empty.

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
    "payer_first_name" TEXT NOT NULL,
    "payer_last_name" TEXT NOT NULL,
    "identification_num" TEXT NOT NULL,
    "identification_type" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "event_id", "event_time_id", "location", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt") SELECT "createdAt", "event_id", "event_time_id", "location", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
