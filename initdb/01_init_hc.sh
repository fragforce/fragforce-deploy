#!/bin/bash
set -e

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE DATABASE hc;"
psql -U "$POSTGRES_USER" -d hc -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -U "$POSTGRES_USER" -d hc < /docker-entrypoint-initdb.d/ffsfdc.sql
