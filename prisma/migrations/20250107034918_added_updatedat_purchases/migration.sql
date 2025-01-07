/*
  Warnings:

  - Added the required column `updatedAt` to the `Purchases` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Purchases" (
    "purchase_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "purchaser_id" INTEGER NOT NULL,
    "event_time_id" INTEGER NOT NULL,
    "total_quantity" INTEGER NOT NULL,
    "total_price" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Purchases" ("createdAt", "event_time_id", "purchase_id", "purchaser_id", "total_price", "total_quantity") SELECT "createdAt", "event_time_id", "purchase_id", "purchaser_id", "total_price", "total_quantity" FROM "Purchases";
DROP TABLE "Purchases";
ALTER TABLE "new_Purchases" RENAME TO "Purchases";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
