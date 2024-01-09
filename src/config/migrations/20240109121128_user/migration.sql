/*
  Warnings:

  - The primary key for the `Occupation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pk` on the `Occupation` table. All the data in the column will be lost.
  - The primary key for the `Role` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pk` on the `Role` table. All the data in the column will be lost.
  - The primary key for the `ShippingAddress` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pk` on the `ShippingAddress` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `birthdate` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `pk` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FavoriteCategories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Hobbies` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubCategories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserHobbies` table. If the table is not empty, all the data it contains will be lost.
  - Changed the type of `id` on the `Occupation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Role` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `ShippingAddress` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Made the column `label` on table `ShippingAddress` required. This step will fail if there are existing NULL values in that column.
  - Changed the type of `id` on the `User` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Made the column `phone` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "FavoriteCategories" DROP CONSTRAINT "FavoriteCategories_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "FavoriteCategories" DROP CONSTRAINT "FavoriteCategories_userId_fkey";

-- DropForeignKey
ALTER TABLE "ShippingAddress" DROP CONSTRAINT "ShippingAddress_userId_fkey";

-- DropForeignKey
ALTER TABLE "SubCategories" DROP CONSTRAINT "SubCategories_categryId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_occupationId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_roleId_fkey";

-- DropForeignKey
ALTER TABLE "UserHobbies" DROP CONSTRAINT "UserHobbies_hobbiesId_fkey";

-- DropForeignKey
ALTER TABLE "UserHobbies" DROP CONSTRAINT "UserHobbies_userId_fkey";

-- DropIndex
DROP INDEX "Occupation_pk_key";

-- DropIndex
DROP INDEX "Role_pk_key";

-- DropIndex
DROP INDEX "ShippingAddress_pk_key";

-- DropIndex
DROP INDEX "User_pk_key";

-- AlterTable
ALTER TABLE "Occupation" DROP CONSTRAINT "Occupation_pkey",
DROP COLUMN "pk",
ADD COLUMN     "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedBy" UUID,
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL;

-- AlterTable
ALTER TABLE "Role" DROP CONSTRAINT "Role_pkey",
DROP COLUMN "pk",
ADD COLUMN     "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedBy" UUID,
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL;

-- AlterTable
ALTER TABLE "ShippingAddress" DROP CONSTRAINT "ShippingAddress_pkey",
DROP COLUMN "pk",
ADD COLUMN     "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedBy" UUID,
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ALTER COLUMN "label" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "birthdate",
DROP COLUMN "pk",
ADD COLUMN     "birthDate" TIMESTAMP(3),
ADD COLUMN     "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedBy" UUID,
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ALTER COLUMN "fullName" DROP NOT NULL,
ALTER COLUMN "phone" SET NOT NULL;

-- DropTable
DROP TABLE "Categories";

-- DropTable
DROP TABLE "FavoriteCategories";

-- DropTable
DROP TABLE "Hobbies";

-- DropTable
DROP TABLE "SubCategories";

-- DropTable
DROP TABLE "UserHobbies";

-- CreateTable
CREATE TABLE "UserHobby" (
    "id" UUID NOT NULL,
    "userId" UUID,
    "hobbyId" UUID,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" UUID,
    "updatedBy" UUID,
    "deletedAt" TIMESTAMP(3)
);

-- CreateTable
CREATE TABLE "Hobby" (
    "id" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" UUID,
    "updatedBy" UUID,
    "deletedAt" TIMESTAMP(3)
);

-- CreateTable
CREATE TABLE "Category" (
    "id" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" UUID,
    "updatedBy" UUID,
    "deletedAt" TIMESTAMP(3)
);

-- CreateTable
CREATE TABLE "SubCategory" (
    "id" UUID NOT NULL,
    "categoryId" UUID NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" UUID,
    "updatedBy" UUID,
    "deletedAt" TIMESTAMP(3)
);

-- CreateTable
CREATE TABLE "FavoriteCategory" (
    "id" UUID NOT NULL,
    "userId" UUID,
    "categoryId" UUID,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" UUID,
    "updatedBy" UUID,
    "deletedAt" TIMESTAMP(3)
);

-- CreateIndex
CREATE UNIQUE INDEX "UserHobby_id_key" ON "UserHobby"("id");

-- CreateIndex
CREATE INDEX "UserHobby_id_idx" ON "UserHobby"("id");

-- CreateIndex
CREATE INDEX "UserHobby_userId_idx" ON "UserHobby"("userId");

-- CreateIndex
CREATE INDEX "UserHobby_hobbyId_idx" ON "UserHobby"("hobbyId");

-- CreateIndex
CREATE UNIQUE INDEX "Hobby_id_key" ON "Hobby"("id");

-- CreateIndex
CREATE INDEX "Hobby_id_idx" ON "Hobby"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Category_id_key" ON "Category"("id");

-- CreateIndex
CREATE INDEX "Category_id_idx" ON "Category"("id");

-- CreateIndex
CREATE UNIQUE INDEX "SubCategory_id_key" ON "SubCategory"("id");

-- CreateIndex
CREATE INDEX "SubCategory_id_idx" ON "SubCategory"("id");

-- CreateIndex
CREATE INDEX "SubCategory_categoryId_idx" ON "SubCategory"("categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "FavoriteCategory_id_key" ON "FavoriteCategory"("id");

-- CreateIndex
CREATE INDEX "FavoriteCategory_id_idx" ON "FavoriteCategory"("id");

-- CreateIndex
CREATE INDEX "FavoriteCategory_userId_idx" ON "FavoriteCategory"("userId");

-- CreateIndex
CREATE INDEX "FavoriteCategory_categoryId_idx" ON "FavoriteCategory"("categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "Occupation_id_key" ON "Occupation"("id");

-- CreateIndex
CREATE INDEX "Occupation_id_idx" ON "Occupation"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Role_id_key" ON "Role"("id");

-- CreateIndex
CREATE INDEX "Role_id_idx" ON "Role"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ShippingAddress_id_key" ON "ShippingAddress"("id");

-- CreateIndex
CREATE INDEX "ShippingAddress_id_idx" ON "ShippingAddress"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE INDEX "User_id_idx" ON "User"("id");

-- CreateIndex
CREATE INDEX "User_roleId_idx" ON "User"("roleId");

-- CreateIndex
CREATE INDEX "User_occupationId_idx" ON "User"("occupationId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_occupationId_fkey" FOREIGN KEY ("occupationId") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShippingAddress" ADD CONSTRAINT "ShippingAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserHobby" ADD CONSTRAINT "UserHobby_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserHobby" ADD CONSTRAINT "UserHobby_hobbyId_fkey" FOREIGN KEY ("hobbyId") REFERENCES "Hobby"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubCategory" ADD CONSTRAINT "SubCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FavoriteCategory" ADD CONSTRAINT "FavoriteCategory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FavoriteCategory" ADD CONSTRAINT "FavoriteCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;
