-- Create profiles table
CREATE TABLE
  public.test (
    "id" UUID NOT NULL,
    "updated_at" timestamptz NULL,
    "username" TEXT NULL,
    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
  );
