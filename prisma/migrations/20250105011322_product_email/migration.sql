-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL DEFAULT 'placeholder@example.com',
    "description" TEXT,
    "price" REAL NOT NULL,
    "image" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "description", "id", "image", "name", "price", "updatedAt") SELECT "createdAt", "description", "id", "image", "name", "price", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
CREATE UNIQUE INDEX "Tickets_email_key" ON "Tickets"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
