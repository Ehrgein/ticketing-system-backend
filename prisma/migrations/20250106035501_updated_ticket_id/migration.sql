/*
  Warnings:

  - The primary key for the `Tickets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `event_id` on the `Tickets` table. All the data in the column will be lost.
  - Added the required column `id` to the `Tickets` table without a default value. This is not possible if the table is not empty.

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
INSERT INTO "new_Tickets" ("createdAt", "location_id", "price", "quantity", "updatedAt") SELECT "createdAt", "location_id", "price", "quantity", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
