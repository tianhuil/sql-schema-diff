alter table "private"."test" add column "age" integer;

CREATE INDEX test_search_idx ON private.test USING btree (username);

create or replace view "private"."test_view" as  SELECT test.id,
    test.username,
    test.age
   FROM private.test;




