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
    "quantity" INTEGER,
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
INSERT INTO "new_Tickets" ("createdAt", "event_id", "event_time_id", "identification_num", "identification_type", "location", "payer_email", "payer_firstName", "payer_id", "payer_lastName", "price_per_ticket", "purchaser_id", "quantity", "seat_location", "ticket_id", "updatedAt") SELECT "createdAt", "event_id", "event_time_id", "identification_num", "identification_type", "location", "payer_email", "payer_firstName", "payer_id", "payer_lastName", "price_per_ticket", "purchaser_id", "quantity", "seat_location", "ticket_id", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
