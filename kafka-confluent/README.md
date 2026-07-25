# Purpose
* Manage a Confluent Platform (CE) Kafka stack in docker on local machines.
* Exists as docker-compose to make multi-node easier .

## References
* Confluent with UI: https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html
* Copied from: https://github.com/confluentinc/cp-all-in-one/tree/v8.3.0/cp-all-in-one
* You can find information about confluent images at https://docs.confluent.io/current/installation/docker/image-reference.html

# Features
* Upgraded 2026-07 from Confluent Platform 5.5.1 to 8.3.0. This was a re-derivation from today's upstream baseline, not just a version bump:
    * **ZooKeeper is gone.** Kafka now runs in KRaft mode -- the single `broker` service acts as both broker and metadata controller. There is no `zookeeper` service or volume anymore.
    * **Control Center changed.** The old `cp-enterprise-control-center` image is deprecated; this now uses `cp-enterprise-control-center-next-gen`, which reads cluster health from the new `prometheus` and `alertmanager` services rather than a Kafka metrics topic alone.
    * **`ksqldb-cli` and `ksql-datagen` are gone** -- upstream no longer ships either. Use `docker exec -it ksqldb-server ksql http://localhost:8088` for a CLI.
    * **Not carried over:** upstream's current baseline also bundles a small Apache Flink stack (`flink-jobmanager`, `flink-taskmanager`, `flink-sql-client`). Left out here to keep this example's footprint close to what it was before -- copy the `flink-*` service blocks from the upstream link above if you want them.
* No persistent volume for the broker's Kafka data (same as before this upgrade) -- a named volume there causes an `AccessDeniedException` on startup, since the broker image runs as a non-root user but Docker creates named volumes owned by root by default. This is meant to be a disposable quickstart, not a durable cluster.
* The Confluent Control Center web UI is on http://localhost:9021/
* Recommends allocating 8GB of memory to Docker

# Docker Management
See README.md in the [root of this repo](../README.md)

# IDE Integration
No IDE integrations specific to this project are called out at this time.
