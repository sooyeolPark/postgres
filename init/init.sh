#!/bin/sh
set -e

echo "START INIT-DB";

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PWD';
  GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $APP_DB_USER;
  GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $APP_DB_USER;
  ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO $APP_DB_USER;
  ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO $APP_DB_USER;
  \connect $POSTGRES_DB $POSTGRES_USER;
EOSQL
