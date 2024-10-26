/*
  Warnings:

  - You are about to drop the column `apellido` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `google_id` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `telefono` on the `User` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "User_google_id_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "apellido",
DROP COLUMN "created_at",
DROP COLUMN "google_id",
DROP COLUMN "nombre",
DROP COLUMN "telefono",
ADD COLUMN     "emailVerified" TIMESTAMP(3),
ADD COLUMN     "image" TEXT,
ADD COLUMN     "name" TEXT;
