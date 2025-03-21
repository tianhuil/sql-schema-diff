DROP SCHEMA IF EXISTS private CASCADE;

CREATE SCHEMA IF NOT EXISTS private;


-- Create profiles table
CREATE TABLE
  private.test (
    "id" UUID NOT NULL,
    "updated_at" timestamptz NULL,
    "username" TEXT NULL,
    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
  );

CREATE VIEW private.test_view AS
SELECT id, username FROM private.test;
