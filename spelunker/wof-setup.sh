#!/usr/bin/env bash

export PGPASSWORD=${POSTGRES_PASSWORD}

createdb -U ${POSTGRES_USER} -h ${POSTGRES_HOST} -E UTF8 -T template0 ${POSTGRES_DB}
psql -U ${POSTGRES_USER} -h ${POSTGRES_HOST} ${POSTGRES_DB} -c "
  CREATE EXTENSION postgis;
  CREATE EXTENSION postgis_topology;
  CREATE TABLE whosonfirst (id BIGINT PRIMARY KEY, parent_id BIGINT, placetype VARCHAR, properties TEXT, geom GEOGRAPHY(MULTIPOLYGON, 4326), centroid GEOGRAPHY(POINT, 4326));
  CREATE INDEX by_geom ON whosonfirst USING GIST(geom);
  CREATE INDEX by_placetype ON whosonfirst (placetype);
"
psql -U ${POSTGRES_USER} -h ${POSTGRES_HOST} ${POSTGRES_DB} -c "VACUUM ANALYZE;"

exit 0
