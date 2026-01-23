/*
  Warnings:

  - You are about to drop the column `status` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `userTypeId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Ad` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AdSignal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Administrator` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `City` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Customer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Image` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Notification` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Plan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `State` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Store` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StorePlan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CategoryToProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CategoryToStore` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `adCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `adCity` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ad" DROP CONSTRAINT "Ad_customerId_fkey";

-- DropForeignKey
ALTER TABLE "AdSignal" DROP CONSTRAINT "AdSignal_adId_fkey";

-- DropForeignKey
ALTER TABLE "AdSignal" DROP CONSTRAINT "AdSignal_storeId_fkey";

-- DropForeignKey
ALTER TABLE "Administrator" DROP CONSTRAINT "Administrator_userId_fkey";

-- DropForeignKey
ALTER TABLE "City" DROP CONSTRAINT "City_stateId_fkey";

-- DropForeignKey
ALTER TABLE "Customer" DROP CONSTRAINT "Customer_userId_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_adId_fkey";

-- DropForeignKey
ALTER TABLE "Notification" DROP CONSTRAINT "Notification_adId_fkey";

-- DropForeignKey
ALTER TABLE "Notification" DROP CONSTRAINT "Notification_userId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_storeId_fkey";

-- DropForeignKey
ALTER TABLE "Store" DROP CONSTRAINT "Store_cityId_fkey";

-- DropForeignKey
ALTER TABLE "Store" DROP CONSTRAINT "Store_userId_fkey";

-- DropForeignKey
ALTER TABLE "StorePlan" DROP CONSTRAINT "StorePlan_planId_fkey";

-- DropForeignKey
ALTER TABLE "StorePlan" DROP CONSTRAINT "StorePlan_storeId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_userTypeId_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToProduct" DROP CONSTRAINT "_CategoryToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToProduct" DROP CONSTRAINT "_CategoryToProduct_B_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToStore" DROP CONSTRAINT "_CategoryToStore_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToStore" DROP CONSTRAINT "_CategoryToStore_B_fkey";

-- DropForeignKey
ALTER TABLE "adCategory" DROP CONSTRAINT "adCategory_adId_fkey";

-- DropForeignKey
ALTER TABLE "adCategory" DROP CONSTRAINT "adCategory_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "adCity" DROP CONSTRAINT "adCity_adId_fkey";

-- DropForeignKey
ALTER TABLE "adCity" DROP CONSTRAINT "adCity_cityId_fkey";

-- DropIndex
DROP INDEX "User_userTypeId_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "status",
DROP COLUMN "userTypeId",
ALTER COLUMN "email" SET DATA TYPE TEXT,
ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "name" SET DATA TYPE TEXT,
ALTER COLUMN "password" SET DATA TYPE TEXT;

-- DropTable
DROP TABLE "Ad";

-- DropTable
DROP TABLE "AdSignal";

-- DropTable
DROP TABLE "Administrator";

-- DropTable
DROP TABLE "Category";

-- DropTable
DROP TABLE "City";

-- DropTable
DROP TABLE "Customer";

-- DropTable
DROP TABLE "Image";

-- DropTable
DROP TABLE "Notification";

-- DropTable
DROP TABLE "Plan";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "State";

-- DropTable
DROP TABLE "Store";

-- DropTable
DROP TABLE "StorePlan";

-- DropTable
DROP TABLE "UserType";

-- DropTable
DROP TABLE "_CategoryToProduct";

-- DropTable
DROP TABLE "_CategoryToStore";

-- DropTable
DROP TABLE "adCategory";

-- DropTable
DROP TABLE "adCity";

-- DropEnum
DROP TYPE "AdStatus";

-- DropEnum
DROP TYPE "NotificationStatus";

-- DropEnum
DROP TYPE "NotificationType";

-- DropEnum
DROP TYPE "SubscriptionStatus";

-- DropEnum
DROP TYPE "UserStatus";

-- CreateTable
CREATE TABLE "Questions" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Answers" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,

    CONSTRAINT "Answers_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Questions" ADD CONSTRAINT "Questions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
