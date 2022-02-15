# Docker solution for PostgreSQL

## Start and stop container

* (optional) change `.env` file
* start: `./dev pg-up`
* stop: `./dev pg-down`

Caveat: to remove all data, please remove `tmp` dir.

If you want have some bootstrap shell scripts, added to `/docker-entrypoint-initdb.d/` of `container`

## Example for use

* import some data and execute query in psql shell

```bash
$ docker exec -it docker_pgserver_1 bash
$ psql -h localhost -d pg_test -U postgres -f /geodata/geo_admin_province.sql # import sql file
$ su postgres # login to user of postgres
$ psql # enter psql shell
$# \c pg_test # switch to db
$# select ST_AsGeoJson(geom) from geo_admin_province where name='上海市'; # execute sql query
```
* use pgAdmin4

[http://localhost:5433/](http://localhost:5433/)

`Caveat`: pgAdmin will up in `1` or `2` mins after `./dev pg-up`

* username: p@g.sql
* password: postgres
* db user: postgres
* db password: postgres
* server address: pgserver
* server port: 5432
* pgAdmin port: 5433

## Docker image choice

* postgresql: `postgres:14.1`

* postgresql + postgis: `postgis/postgis:14-master`

Pros of using postgis image:
1. Have all sort of GIS functions, and data types for spatial data.
1. Does not impact performance of postgresql, due to PostGIS is only a function library, does not change engine of postgresql.

Cons: 

1. Larger image size
1. May not useful
