---
name: docker-example
description: Use this skill for any work on this docker-scripts repo's container examples — adding a brand-new service example (new subdirectory with docker-compose.yml + README.md, plus a row in the root README table), tuning an existing example's resource limits/ports/env vars/OS-level settings, or upgrading an example to a newer version of the underlying software with today's upstream baseline. Trigger on requests like "add a new container/example for X", "scaffold a docker-compose for Y", "set up Z in this repo", "tune/adjust the memory/ports/env vars for the <service> example", "why is <service> running out of memory", "upgrade <service> to the latest version", "bump the <service> image version", or "is <service>'s example out of date" — even if the user doesn't say "skill" or name this repo's conventions explicitly.
---

# Docker Example (docker-scripts repo)

This repo is a collection of `docker-compose` examples, one per subdirectory, that people clone and run locally to try out a product (Redis, Neo4j, Elasticsearch, etc.) or tune for their own use. Every example follows the same shape, and people rely on that consistency to navigate a directory they've never opened before. Your job is either to **add a new example** that fits the pattern, or to **tune an existing one** without breaking it.

Start by deciding which of the two you're doing — most requests make this obvious, but if not, ask.

## Before you touch anything: read a live example

Don't work from memory of "what docker-compose files usually look like." This repo's conventions are specific and are enforced by precedent, not by a linter. Pick the existing example closest in shape to your task (single-node vs multi-node, GUI vs headless, `.env`-driven vs hardcoded) and read both its `docker-compose.yml` and `README.md` in full before writing anything. Good references:

| If you need... | Look at |
|---|---|
| Simplest possible single-node service | `redis/` |
| Single-node with named volumes | `neo4j/` |
| Multi-node cluster + `.env` for secrets/tuning | `elasticsearch/` |
| Service with a shared host directory mount | `anaconda/` or `tensorflow/` |

Copying the structure of a real neighbor prevents subtle drift (e.g. inventing a new network name instead of reusing `private_net`, or a volume naming style that doesn't match the rest of the repo).

## Workflow A: Add a new example

1. **Pick the directory name** — lowercase, matches the product/tool name, matches how existing dirs are named (e.g. `kafka-confluent`, not `kafka`, when there's a specific distribution being packaged).
2. **Check for port collisions.** Grep other `docker-compose.yml` files for `- <port>:` before picking a host port; this repo has no central port registry, so the only way to avoid a collision is to check.
3. **Write `docker-compose.yml`** following the established shape:
   - `version: '3.3'` at the top, plus a comment linking to the source doc/guide the compose file was derived from (every existing example does this — it's how future maintainers verify against upstream).
   - `container_name` and `hostname` set explicitly to the service name.
   - Named volumes for anything that should survive a restart, with a comment noting that the real volume name will be prefixed with the directory name by docker-compose (see `redis/docker-compose.yml` and `neo4j/docker-compose.yml` for the comment wording).
   - A `private_net` bridge network (reuse this name — it's the repo-wide convention, not per-project), with the same "actual name will be prefixed" comment.
   - Only add a `.env` file if there's a real secret or a value worth letting the user tune (see elasticsearch's `${MEM_LIMIT}`, `${ELASTIC_PASSWORD}` pattern with `.env.template`). Don't add one just to have one — most examples are fully hardcoded and that's fine.
4. **Write `README.md`** with these sections, in this order (matches every existing example):
   - `# Purpose` — one or two lines on what it manages and why it's a compose file even for a single node ("to make multi-node easier in future" is the repo's stock reasoning, reuse it if it applies).
   - `# Setup` — only if there's a `.env` or other manual step before `docker-compose up`.
   - `# Features` — bullet list: named volume persistence note, the URL(s) for any web UI, the shell-access command (`docker exec -it <container> ...`), and a note if that command is known not to work from Git Bash on Windows (recurring caveat in this repo).
   - `# Docker Management` — always exactly: `See README.md in the [root of this repo](../README.md) for interesting docker commands.`
   - `# IDE Integration` — either real guidance (see `anaconda/README.md`) or the stock line `No IDE integrations specific to this project are called out at this time.`
5. **Add a row to the root `README.md` table** (`# Available Containers/Images`), keeping the existing column order (Product, Distribution, GUI container, Min Memory, Local Mounts) and formatting. Use `??` for Min Memory if you don't have a real number, and the literal token `-none-` (not "none", "None", or "-"; grep the table for the exact string first) for any column that doesn't apply — that's the existing convention, not a gap you need to fill in. Copy-paste the token from a real row rather than retyping it.

## Workflow B: Tune an existing example

"Tuning" in this repo means changing something a person running the container would plausibly want to adjust: memory limits, exposed ports, credentials, or host OS kernel settings the container depends on (the elasticsearch `vm.max_map_count` docs are the model for this last one).

1. **Find out what's actually tunable today.** Some examples hardcode everything (redis, neo4j); others expose knobs via `.env` (elasticsearch's `MEM_LIMIT`, `STACK_VERSION`, etc.). Match whatever pattern the target example already uses — don't introduce a `.env` file into a hardcoded example just to make one value tunable, and don't hardcode a value in an example that already has a `.env` convention.
2. **Make the change** in `docker-compose.yml` / `.env` / `.env.template`, keeping existing formatting and comments intact.
   - **A `mem_limit` alone doesn't tune memory for JVM- or Node-based images** (elasticsearch, kibana, and anything else with a managed-heap runtime) — it only sets the point at which Docker kills the container. If the runtime itself doesn't know about that ceiling, it will still try to size its heap off the *host's* memory and can get OOM-killed well before anything looks wrong. Every service on a managed runtime needs its own heap flag capped below its `mem_limit` too (e.g. `ES_JAVA_OPTS=-Xms/-Xmx` for Elasticsearch, `NODE_OPTIONS=--max-old-space-size=...` for Kibana or other Node services) — set both together, not just the container limit.
3. **Document the knob.** If you're adding a new tunable parameter (not just changing a value), add a line under `# Features` or a new section explaining what it controls and why someone would change it — future readers shouldn't have to diff the compose file to discover a setting exists. If the tuning is about an OS-level prerequisite (like `vm.max_map_count`), follow elasticsearch's `# Troubleshooting ...` section as the template: explain the symptom, then the fix, then link sources.
4. **Update the root README table** if the change affects the Min Memory column or anything else shown there.

## Workflow C: Upgrade an example to a newer version

"Upgrade" means moving an example off a stale pinned version to whatever the upstream project currently recommends — it is not just editing a version string. Every example's `docker-compose.yml` has a comment linking to the upstream doc/repo it was originally derived from (e.g. kafka-confluent's `# from https://docs.confluent.io/...` and `# copied from https://github.com/confluentinc/cp-all-in-one/`); that link is the source of truth for the *current* baseline, since the upstream project's recommended setup can drift a lot between an old pinned version and today (new required services, renamed env vars, a whole architecture change).

1. **Follow the comment link(s) to the live upstream source** and compare today's recommended compose file against this repo's example. Don't assume the only thing that changed is the version number — check whether upstream added, removed, or replaced a component (e.g. a coordination service being swapped for a different mode) as part of the newer baseline.
2. **Bump every image tag for that product consistently.** Multi-service examples (kafka-confluent, elasticsearch) pin several images to the same platform version — moving one and leaving others behind creates a broken, half-upgraded stack.
3. **Carry over renamed/added/removed config.** If upstream's current baseline structurally differs from what's in this repo (not just a version bump but a different recommended shape), that's a judgment call worth surfacing to the user rather than silently picking one — say what changed upstream and ask whether to follow it or keep the old approach for a stated reason.
4. **Update the README** — refresh `# References`/guide links if upstream moved them, and update `# Features` if the new version changes ports, UIs, default credentials, or memory guidance.
5. **Call out what moved.** Note the old version being replaced (in the commit message, or a short line in the README) so it's clear this was a deliberate upgrade someone can trace later, not a partial edit.

## Things that break the pattern (avoid these)

- Inventing a new Docker network per example instead of reusing `private_net`.
- Skipping the "actual name will be prefixed by directory name" comment on volumes/networks — it's there because the synthesized name surprises people once (see the root README's `# Named Volumes` section) and the repo now documents it everywhere as a preventive measure.
- Writing a Dockerfile when the upstream project already ships an image that does the job — every current example just references an existing image.
- Forgetting the root README table row — an example that isn't listed there is effectively undiscoverable.
