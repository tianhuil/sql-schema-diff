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

CREATE VIEW private.test_view AS
SELECT id, username, age FROM private.test;

CREATE OR REPLACE FUNCTION private.get_age_category(user_age INTEGER)
RETURNS TEXT AS $$
BEGIN
  RETURN CASE
    WHEN user_age < 18 THEN 'Minor'
    WHEN user_age BETWEEN 18 AND 65 THEN 'Adult'
    ELSE 'Senior'
  END;
END;
$$ LANGUAGE plpgsql;

-- Create index "profiles_search_idx" to table: profiles
CREATE INDEX "test_search_idx" ON private.test ("username");
