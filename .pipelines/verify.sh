#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

docker compose --profile develop run --rm develop make verify
