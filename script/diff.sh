#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check for the argument
if [ "$#" -eq 1 ]; then
  if [ "$1" == "gen" ]; then
    GEN=true
  else
    echo "Error: Invalid argument. Use 'gen' to generate initial table."
    exit 1
  fi
elif [ "$#" -gt 1 ]; then
  echo "Error: Too many arguments. Use 'gen' to generate initial table."
  exit 1
fi

run_psql() {
  psql -q "$@" 2> >(grep -Ev "already exists, skipping|does not exist, skipping|will be truncated to" >&2)
}

# Database connection details
DB_STR=postgresql://postgres:postgres@127.0.0.1:54322
CURRENT_DB=current
TARGET_DB=target

# Drop and create the current database
run_psql "$DB_STR/postgres" -c "DROP DATABASE IF EXISTS $CURRENT_DB;"
run_psql "$DB_STR/postgres" -c "CREATE DATABASE $CURRENT_DB;"

# Drop and create the target database
run_psql "$DB_STR/postgres" -c "DROP DATABASE IF EXISTS $TARGET_DB;"
run_psql "$DB_STR/postgres" -c "CREATE DATABASE $TARGET_DB;"

run_psql $DB_STR/$CURRENT_DB < script/current.sql
run_psql $DB_STR/$TARGET_DB < script/target.sql

bun run migra \
  $DB_STR/$CURRENT_DB \
  $DB_STR/$TARGET_DB \
  --unsafe \
  --schema public \
  --with-privileges
  > result/migra-diff.sql
