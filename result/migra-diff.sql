alter table "public"."test" add column "age" integer;

CREATE INDEX test_search_idx ON public.test USING btree (username);


