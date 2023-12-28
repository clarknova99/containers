<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->


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


