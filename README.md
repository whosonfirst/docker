## Getting started
* install docker as per your local environment requirements
* `WOF_DATA=/path/to/wof/data docker-compose build`
* `WOF_DATA=/path/to/wof/data docker-compose up`

## Environment
* locally, you'll be able to reach the following endpoints
  * postgis:5432
  * elasticsearch:9200
  * spelunker:80/spelunker
* for example, from your local machine:
  * `curl localhost:9200/whosonfirst/_count?pretty` (assuming you've loaded some documents)
  * note that on OSX you'll need to substitute localhost with whatever IP is assigned to your local docker/virtualbox host (see ${DOCKER_HOST})

## Load Data
* connect to the spelunker instance where the WOF data is mounted: `docker exec -i -t ${spelunker_id} bash`
  * use `docker ps` to get the id of the spelunker container
* load ES data in bulk: `wof-es-index -s /wof/wof-data/data -b --host=elasticsearch`
* load individual files to ES: `wof-es-index-file --host=elasticsearch /path/to/file.geojson`
* load postgis data: `wof-spatial-index -s /wof/wof-data/data -c /wof/wof.cfg`

## Starting Over
* `docker-composer rm`, then proceed as before
