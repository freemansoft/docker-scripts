# Purpose
* Manage a single-node OpenTelemetry Collector in docker on local machines, for receiving traces/metrics/logs from apps you're developing.
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://opentelemetry.io/docs/collector/install/docker/

# Features
* Uses the `-contrib` image (more receivers/exporters than the core image) so it's easy to extend later -- swap to `otel/opentelemetry-collector:latest` if you want something leaner and don't need the extra components.
* No named volume -- the collector itself is stateless; only `otel-collector-config.yml` is mounted in.
* Traces and metrics have no downstream backend configured -- they just log to the container's own stdout via the `debug` exporter, so you can confirm telemetry is arriving with `docker logs otel-collector` before wiring up something like Tempo or Prometheus.
* **Logs are wired to the `loki/` example** in this repo, in addition to stdout. Since each example here is its own separate docker-compose project (its own isolated network), this crosses that boundary via `host.docker.internal` rather than a shared Docker network -- start `loki` alongside this one (both need to be running) and logs sent here show up queryable in Loki. If `loki` isn't running, the exporter just fails quietly in the background; stdout logging still works either way.
* Point an app's OTLP exporter at `grpc://localhost:4317` or `http://localhost:4318`.
* Open shell command prompt with `docker exec -it otel-collector sh`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.
