#!/bin/bash

CONFLUENT_VERSION="5.5.1"
JOLOKIA_VERSION="1.6.2"
echo "Basing this on kafka version: $CONFLUENT_VERSION and Jolokia version: $JOLOKIA_VERSION"
# Our version matches the Kafka version we build from
docker build \
    --tag freemansoft/cp-server:$CONFLUENT_VERSION \
    --build-arg CONFLUENT_VERSION=$CONFLUENT_VERSION \
    --build-arg JOLOKIA_VERSION=$JOLOKIA_VERSION \
    .
