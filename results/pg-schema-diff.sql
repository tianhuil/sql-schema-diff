ALTER TABLE "private"."test" ADD COLUMN "age" integer;

-- INDEX_BUILD: This might affect database performance. Concurrent index builds require a non-trivial amount of CPU, potentially affecting database performance. They also can take a while but do not lock out writes.
CREATE INDEX CONCURRENTLY test_search_idx ON private.test USING btree (username);


