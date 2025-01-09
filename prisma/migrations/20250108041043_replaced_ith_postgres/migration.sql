-- CreateTable
CREATE TABLE "Tickets" (
    "ticket_id" SERIAL NOT NULL,
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
    "identification_type" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "purchase_id" INTEGER,

    CONSTRAINT "Tickets_pkey" PRIMARY KEY ("ticket_id")
);

-- CreateTable
CREATE TABLE "Events" (
    "event_id" SERIAL NOT NULL,
    "event_name" TEXT,
    "location" TEXT,
    "description" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Events_pkey" PRIMARY KEY ("event_id")
);

-- CreateTable
CREATE TABLE "EventTimes" (
    "event_time_id" SERIAL NOT NULL,
    "event_id" INTEGER NOT NULL,
    "datetime" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EventTimes_pkey" PRIMARY KEY ("event_time_id")
);

-- CreateTable
CREATE TABLE "Purchases" (
    "purchase_id" SERIAL NOT NULL,
    "purchaser_id" INTEGER NOT NULL,
    "event_time_id" INTEGER NOT NULL,
    "total_quantity" INTEGER NOT NULL,
    "total_price" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Purchases_pkey" PRIMARY KEY ("purchase_id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "purchaser_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "dni" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_purchase_id_fkey" FOREIGN KEY ("purchase_id") REFERENCES "Purchases"("purchase_id") ON DELETE SET NULL ON UPDATE CASCADE;
