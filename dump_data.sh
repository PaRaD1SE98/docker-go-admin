#!/bin/bash
DOCKER_COMPOSE_PREFIX="docker-go-admin"
NETWORK_NAME="default"
DB_HOST="db"
DB_USERNAME="postgres"
DB_NAME="postgres"
PGPASSWORD="postgres"
TEMPORARY_DIRECTORY_TO_STORE_BACKUP_FILE=/tmp2
BACKUP_DATA_DIRECTORY=$(pwd)/init_data

docker run -it --rm \
      --network=${DOCKER_COMPOSE_PREFIX}_${NETWORK_NAME} \
      --volume "${BACKUP_DATA_DIRECTORY}:${TEMPORARY_DIRECTORY_TO_STORE_BACKUP_FILE}" \
      --env PGPASSWORD="${PGPASSWORD}" \
      postgres:13.3-alpine \
      psql \
      --host=${DB_HOST} \
      --username=${DB_USERNAME} \
      --dbname=${DB_NAME} \
      --file="${TEMPORARY_DIRECTORY_TO_STORE_BACKUP_FILE}/admin.pgsql"