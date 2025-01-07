/*
  Warnings:

  - The primary key for the `Tickets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `location_id` on the `Tickets` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `Tickets` table. All the data in the column will be lost.
  - Added the required column `event_time_id` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `purchaser_id` to the `Tickets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ticket_id` to the `Tickets` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "EventTimes" (
    "event_time_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "event_id" INTEGER NOT NULL,
    "datetime" DATETIME NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Purchases" (
    "purchase_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "purchaser_id" INTEGER NOT NULL,
    "event_time_id" INTEGER NOT NULL,
    "total_quantity" INTEGER NOT NULL,
    "total_price" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "purchaser_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "dni" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Tickets" (
    "ticket_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "event_time_id" INTEGER NOT NULL,
    "purchaser_id" INTEGER NOT NULL,
    "location" INTEGER,
    "seat_location" INTEGER,
    "quantity" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tickets" ("createdAt", "quantity", "updatedAt") SELECT "createdAt", "quantity", "updatedAt" FROM "Tickets";
DROP TABLE "Tickets";
ALTER TABLE "new_Tickets" RENAME TO "Tickets";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
