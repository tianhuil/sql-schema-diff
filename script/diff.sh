SQL_FILE_1="path/to/first.sql"
SQL_FILE_2="path/to/second.sql"

# Initialize Supabase with the first SQL file
echo "Setting up Supabase with the first SQL file..."
bun supabase db reset --version 20250314030801

# Run supabase db diff with the second SQL file
echo "Running supabase db diff with the second SQL file..."
bun supabase db diff --use-migra --local --schema private --file results/migra-diff.sql
bun supabase db diff --use-pgadmin --local --schema private --file results/pgadmin-diff.sql
bun supabase db diff --use-pg-schema --local --schema private --file results/pg-schema-diff.sql
