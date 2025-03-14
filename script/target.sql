CREATE SCHEMA IF NOT EXISTS private;

-- Create profiles table
CREATE TABLE
  private.test (
    "id" UUID NOT NULL,
    "updated_at" timestamptz NULL,
    "username" TEXT NULL,
    "age" INTEGER NULL,
    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
  );

-- Create index "profiles_search_idx" to table: profiles
CREATE INDEX "private"."test_search_idx" ON private.test ("username");
