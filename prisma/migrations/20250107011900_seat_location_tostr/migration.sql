/*
  Warnings:

  - Made the column `seat_location` on table `Tickets` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "ticket_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "event_time_id" INTEGER NOT NULL,
    "event_id" INTEGER NOT NULL,
    "purchaser_id" INTEGER NOT NULL,
    "location" INTEGER,
    "seat_location" TEXT NOT NULL,
    "price_per_ticket" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "event_id", "event_time_id", "location", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt") SELECT "createdAt", "event_id", "event_time_id", "location", "price_per_ticket", "purchaser_id", "seat_location", "ticket_id", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
