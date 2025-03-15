-- HAS_UNTRACKABLE_DEPENDENCIES: Dependencies, i.e. other functions used in the function body, of non-sql functions cannot be tracked. As a result, we cannot guarantee that function dependencies are ordered properly relative to this statement. For adds, this means you need to ensure that all functions this function depends on are created/altered before this statement.
CREATE OR REPLACE FUNCTION private.get_age_category(user_age integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
BEGIN
  RETURN CASE
    WHEN user_age < 18 THEN 'Minor'
    WHEN user_age BETWEEN 18 AND 65 THEN 'Adult'
    ELSE 'Senior'
  END;
END;
$function$
;

ALTER TABLE "private"."test" ADD COLUMN "age" integer;

-- INDEX_BUILD: This might affect database performance. Concurrent index builds require a non-trivial amount of CPU, potentially affecting database performance. They also can take a while but do not lock out writes.
CREATE INDEX CONCURRENTLY test_search_idx ON private.test USING btree (username);


