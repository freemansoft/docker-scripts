# Purpose
* Manage single node Grafana in docker on local machines.
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://hub.docker.com/r/grafana/grafana

# Features
* Creates a named volume to persist dashboards/datasources/settings across restarts. You have to remove the named volume to restore to original.
* The Grafana UI is located at http://localhost:3000/
    * Login with `admin` / `admin` (set via `GF_SECURITY_ADMIN_USER`/`GF_SECURITY_ADMIN_PASSWORD`, so it won't force a password change on first login like the image's own default `admin`/`admin` normally does)
* **A Loki data source is pre-provisioned** (see `provisioning/datasources/loki.yaml`), pointing at the `loki/` example in this repo via `host.docker.internal` -- since each example here is its own separate docker-compose project/network, this is how it reaches across that boundary. Start `loki` alongside this one for it to actually resolve; otherwise the data source just shows as unreachable in the UI, harmlessly.
* No other data sources are pre-configured -- add one pointing at whatever else you're monitoring from the UI, or add another file under `provisioning/datasources/` if you want it automated too.
* Open shell command prompt with `docker exec -it grafana /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.
