<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/clarknova99/sonarr:rolling`                   | ❌         |
| `ghcr.io/clarknova99/sonarr:3.0.8.1507`                | ❌         |
| `ghcr.io/clarknova99/sonarr:rolling@sha256:8053...`    | ✅         |
| `ghcr.io/clarknova99/sonarr:3.0.8.1507@sha256:8053...` | ✅         |

_If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change._

## Passing arguments to a application

Some applications do not support defining configuration via environment variables and instead only allow certain config to be set in the command line arguments for the app. To circumvent this, for applications that have an `entrypoint.sh` read below.

1. First read the Kubernetes docs on [defining command and arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/).
2. Look up the documentation for the application and find a argument you would like to set.
3. Set the argument in the `args` section, be sure to include `entrypoint.sh` as the first arg and any application specific arguments thereafter.

    ```yaml
    args:
      - /entrypoint.sh
      - --port
      - "8080"
    ```

## Configuration volume

For applications that need to have persistent configuration data the config volume is hardcoded to `/config` inside the container. This is not able to be changed in most cases.

## Available Images

Each Image will be built with a `rolling` tag, along with tags specific to it's version. Available Images Below

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[plex]() | stable | ghcr.io/clarknova99/plex |
[plex-beta]() | beta | ghcr.io/clarknova99/plex-beta |
[spark](https://github.com/clarknova99/containers/pkgs/container/spark) | stable | ghcr.io/clarknova99/spark |![3.5.0-scala2.12-java17-ubuntu](https://img.shields.io/badge/3.5.0--scala2.12--java17--ubuntu-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)


