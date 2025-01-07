/*
  Warnings:

  - You are about to drop the column `description` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Tickets` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "price" INTEGER,
    "location_id" INTEGER,
    "quantity" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "id", "location_id", "price", "quantity", "updatedAt") SELECT "createdAt", "id", "location_id", "price", "quantity", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
