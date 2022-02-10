#!/bin/sh

# Force restore a custom dump for a database.
# Example:
# ./restore_pgsql.sh pgdb_20210323035335.backup

psql postgres -c "drop database $POSTGRES_DB;"
psql postgres -c "create database $POSTGRES_DB;"
psql $POSTGRES_DB -c "create extension hstore;"
psql $POSTGRES_DB -c "create extension postgis;"
pg_restore -Fc -O -x -d $POSTGRES_DB /var/lib/postgresql/data/backup/$1
