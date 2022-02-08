#!bin/bash

run:
	dbt deps --profiles-dir=. --project-dir=.
	dbt run --profiles-dir=. --project-dir=. --full-refresh