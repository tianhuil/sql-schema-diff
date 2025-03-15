alter table "private"."test" add column "age" integer;

CREATE INDEX test_search_idx ON private.test USING btree (username);

set check_function_bodies = off;

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

create or replace view "private"."test_view" as  SELECT test.id,
    test.username,
    test.age
   FROM private.test;




