# Purpose
* Manage single node Loki (log aggregation) in docker on local machines.
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://grafana.com/docs/loki/latest/setup/install/docker/

# Features
* No named volume: the Loki image runs as a non-root user (uid 10001), and a fresh Docker named volume defaults to root ownership, so mounting one at Loki's storage path fails with a permission error on startup (the same class of bug found and fixed in `kafka-confluent`'s example). Storage stays at the config's default `/tmp/loki` path, ephemeral, matching Loki's own out-of-the-box example -- fine for local experimentation, not for anything you need to keep.
* Loki's HTTP API (push + query) is on http://localhost:3100/
* Wired into the other observability examples in this repo, when run alongside them:
    * `otel-collector`'s config exports logs here in addition to its stdout `debug` exporter.
    * `grafana`'s Grafana instance has this pre-configured as a Loki data source.
    * Both cross the compose-project boundary via `host.docker.internal`, since each example is its own isolated docker-compose network -- start `loki` first (or at the same time), then `otel-collector` and/or `grafana`, for the wiring to actually connect.
* Open shell command prompt with `docker exec -it loki sh`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.
