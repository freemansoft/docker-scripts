
# set late but not latest default value
ARG CONFLUENT_VERSION
ARG JOLOKIA_VERSION

FROM confluentinc/cp-server:${CONFLUENT_VERSION}

ARG JOLOKIA_VERSION
ARG JOLOKIA_VERSION=${JOLOKIA_VERSION}  
ARG JOLOKIA_SOURCE_JAR=jolokia-jvm-${JOLOKIA_VERSION}-agent.jar 
ARG JOLOKIA_TARGET_JAR=jolokia-jvm-agent.jar 

ARG CONFLUENT_VERSION
ARG CONFLUENT_VERSION=${CONFLUENT_VERSION} 

# Prior to Docker 1.10, it was recommended to combine all labels into a single LABEL instruction, to prevent extra layers from being created.
LABEL org.label-schema.name="kafka" \
      org.label-schema.description="Apache Kafka with Jolokia" \
      org.label-schema.vcs-url="https://github.com/freemansoft/docker-scripts" \
      maintainer="freemansoft"
#      org.label-schema.version="${CONFLUENT_VERSION}" \
#      org.label-schema.version=$BUILD_VERSION

# primary and JMX exposed in parent
# Jolokia
EXPOSE 8778
# JMX
EXPOSE 9101

# RUN \
#       echo "CONFLUENT_VERSION:$CONFLUENT_VERSION ${CONFLUENT_VERSION}"  \
#       && echo "JOLOKIA_VERSION:${JOLOKIA_VERSION} JOLOKIA_SOURCE_JAR:${JOLOKIA_SOURCE_JAR}"  

RUN \
      mkdir -p /opt/jolokia \
      && ls -l /opt/jolokia \
      && wget http://search.maven.org/remotecontent?filepath=org/jolokia/jolokia-jvm/${JOLOKIA_VERSION}/${JOLOKIA_SOURCE_JAR} \
                  --no-check-certificate  \
                  -O /opt/jolokia/$JOLOKIA_TARGET_JAR \
      && ls -l /opt/jolokia




