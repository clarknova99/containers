#!/usr/bin/env bash
version=$(curl -s "https://registry.hub.docker.com/v2/repositories/library/spark/tags?ordering=name" | jq --raw-output --arg s "3.5.0-scala2.12-java17-python3-ubuntu" '.results[] | select(.name | contains($s)) | .name' 2>/dev/null | head -n1)
printf "%s" "${version}"
