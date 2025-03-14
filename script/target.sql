-- Create profiles table
CREATE TABLE
  public.test (
    "id" UUID NOT NULL,
    "updated_at" timestamptz NULL,
    "username" TEXT NULL,
    "age" INTEGER NULL,
    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
  );

-- Create index "profiles_search_idx" to table: profiles
CREATE INDEX "test_search_idx" ON public.test ("username");
