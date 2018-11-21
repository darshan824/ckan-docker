#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER ckan_default with password 'admin123';
    CREATE USER datastore_default with password 'admin123';
    CREATE DATABASE ckan_default OWNER ckan_default ENCODING 'utf-8';
    GRANT ALL PRIVILEGES ON DATABASE ckan_default TO ckan_default;
    CREATE DATABASE datastore_default OWNER ckan_default ENCODING 'utf-8';
    GRANT ALL PRIVILEGES ON DATABASE datastore_default to ckan_default; 
    GRANT ALL PRIVILEGES ON DATABASE datastore_default to datastore_default;
EOSQL
