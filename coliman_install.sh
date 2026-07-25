#!/usr/bin/env bash
set -euo pipefail

# Installs and starts Colima (a lightweight, license-free alternative to Docker
# Desktop on macOS) along with the CLI tools needed to run the docker-compose
# examples in this repo.
#
# Some examples here (e.g. kafka-confluent) recommend up to 8GB of memory; the
# defaults below are sized for that. Override via env vars if your machine
# needs something smaller, e.g.:
#   COLIMA_MEMORY=4 COLIMA_CPU=2 ./coliman_install.sh

COLIMA_CPU="${COLIMA_CPU:-4}"
COLIMA_MEMORY="${COLIMA_MEMORY:-8}"
COLIMA_DISK="${COLIMA_DISK:-60}"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required but not found. Install it from https://brew.sh and re-run this script." >&2
  exit 1
fi

echo "Installing colima, docker CLI, docker-compose, and kubectl..."
brew install colima docker docker-compose kubectl

colima version

if colima status >/dev/null 2>&1; then
  echo "Colima is already running:"
else
  echo "Starting colima with ${COLIMA_CPU} CPUs, ${COLIMA_MEMORY}GB memory, ${COLIMA_DISK}GB disk..."
  colima start --cpu "$COLIMA_CPU" --memory "$COLIMA_MEMORY" --disk "$COLIMA_DISK"
fi

colima status
docker ps
