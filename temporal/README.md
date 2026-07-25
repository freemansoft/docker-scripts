# Purpose
* Manage a single-node Temporal (workflow orchestration engine) cluster, backed by Postgres, in docker on local machines.
* Exists as docker-compose to make multi-node easier in future.
* Guide: https://github.com/temporalio/docker-compose

# Features
* Backed by Postgres (`postgres:16`) rather than the default in-memory/SQLite setup, so workflow history survives a restart via the `temporal_postgres_data` named volume. You have to remove the named volume to restore to original.
* `temporal-admin-tools` gives you a shell with `tctl`/`temporal` CLI pre-installed and already pointed at the server -- `docker exec -it temporal-admin-tools tctl namespace list` (or `temporal` for the newer CLI) to poke around without installing anything locally.
* The Temporal Web UI is located at http://localhost:8080/
* The Temporal frontend service (for SDKs to connect to) is at `localhost:7233`
* Open shell command prompt with `docker exec -it temporal /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.
