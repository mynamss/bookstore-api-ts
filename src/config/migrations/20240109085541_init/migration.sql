-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "roleId" UUID NOT NULL,
    "occupationId" UUID,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "gender" "Gender",
    "birthdate" TIMESTAMP(3),
    "phone" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Occupation" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "details" TEXT,

    CONSTRAINT "Occupation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShippingAddress" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "label" TEXT,
    "recipients" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "provinceCode" INTEGER NOT NULL,
    "districtCode" INTEGER NOT NULL,
    "subDistrictCode" INTEGER NOT NULL,
    "villageCode" INTEGER NOT NULL,
    "postCode" INTEGER NOT NULL,
    "details" TEXT,

    CONSTRAINT "ShippingAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserHobbies" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "hobbiesId" UUID NOT NULL,

    CONSTRAINT "UserHobbies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hobbies" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Hobbies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubCategories" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "categryId" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "SubCategories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FavoriteCategories" (
    "id" SERIAL NOT NULL,
    "pk" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "categoryId" UUID NOT NULL,

    CONSTRAINT "FavoriteCategories_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_id_key" ON "Role"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Role_pk_key" ON "Role"("pk");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_pk_key" ON "User"("pk");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Occupation_id_key" ON "Occupation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Occupation_pk_key" ON "Occupation"("pk");

-- CreateIndex
CREATE UNIQUE INDEX "ShippingAddress_id_key" ON "ShippingAddress"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ShippingAddress_pk_key" ON "ShippingAddress"("pk");

-- CreateIndex
CREATE INDEX "ShippingAddress_userId_idx" ON "ShippingAddress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserHobbies_pk_key" ON "UserHobbies"("pk");

-- CreateIndex
CREATE INDEX "UserHobbies_userId_idx" ON "UserHobbies"("userId");

-- CreateIndex
CREATE INDEX "UserHobbies_hobbiesId_idx" ON "UserHobbies"("hobbiesId");

-- CreateIndex
CREATE UNIQUE INDEX "Hobbies_id_key" ON "Hobbies"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Hobbies_pk_key" ON "Hobbies"("pk");

-- CreateIndex
CREATE UNIQUE INDEX "Categories_id_key" ON "Categories"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Categories_pk_key" ON "Categories"("pk");

-- CreateIndex
CREATE UNIQUE INDEX "SubCategories_id_key" ON "SubCategories"("id");

-- CreateIndex
CREATE UNIQUE INDEX "SubCategories_pk_key" ON "SubCategories"("pk");

-- CreateIndex
CREATE INDEX "SubCategories_categryId_idx" ON "SubCategories"("categryId");

-- CreateIndex
CREATE UNIQUE INDEX "FavoriteCategories_pk_key" ON "FavoriteCategories"("pk");

-- CreateIndex
CREATE INDEX "FavoriteCategories_userId_idx" ON "FavoriteCategories"("userId");

-- CreateIndex
CREATE INDEX "FavoriteCategories_categoryId_idx" ON "FavoriteCategories"("categoryId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_occupationId_fkey" FOREIGN KEY ("occupationId") REFERENCES "Occupation"("pk") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShippingAddress" ADD CONSTRAINT "ShippingAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserHobbies" ADD CONSTRAINT "UserHobbies_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserHobbies" ADD CONSTRAINT "UserHobbies_hobbiesId_fkey" FOREIGN KEY ("hobbiesId") REFERENCES "Hobbies"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubCategories" ADD CONSTRAINT "SubCategories_categryId_fkey" FOREIGN KEY ("categryId") REFERENCES "Categories"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FavoriteCategories" ADD CONSTRAINT "FavoriteCategories_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FavoriteCategories" ADD CONSTRAINT "FavoriteCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"("pk") ON DELETE RESTRICT ON UPDATE CASCADE;
