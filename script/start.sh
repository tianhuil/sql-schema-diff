#!/bin/bash

# start postgres
docker run --name my-postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -p 54322:5432 -d postgres
