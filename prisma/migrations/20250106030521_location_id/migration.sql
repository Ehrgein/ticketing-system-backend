/*
  Warnings:

  - You are about to alter the column `price` on the `Tickets` table. The data in that column could be lost. The data in that column will be cast from `Float` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "email" TEXT DEFAULT 'placeholder@example.com',
    "description" TEXT,
    "price" INTEGER,
    "location_id" INTEGER,
    "quantity" INTEGER,
    "image" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "description", "email", "id", "image", "name", "price", "updatedAt") SELECT "createdAt", "description", "email", "id", "image", "name", "price", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
CREATE UNIQUE INDEX "Tickets_email_key" ON "Tickets"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
