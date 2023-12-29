#!/usr/bin/env bash
#this work?
version=$(curl -s "https://registry.hub.docker.com/v2/repositories/library/spark/tags?ordering=name" | jq --raw-output --arg s "3.5.0" '.results[] | select(.name | contains($s)) | .name' 2>/dev/null | head -n1)
printf "%s" "${version}"
