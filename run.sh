#!/usr/bin/env bash
export NORMALIZE_WORKSPACE="402/0"
docker run --rm -i -v airbyte_workspace:/data -w /data/$NORMALIZE_WORKSPACE/normalize --network host --entrypoint /usr/local/bin/dbt airbyte/normalization debug --profiles-dir=. --project-dir=.