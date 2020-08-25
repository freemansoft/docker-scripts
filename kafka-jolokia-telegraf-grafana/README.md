## Run the services and verify
1. Run build.sh to biuld a Kafka Broker topic image with the Jolokia Agent
2. Start Kafka
  *  >docker-compose -f docker-compose-kafka.ym.
3. Verify Kakfa is up by looking at the Confluent Dashboard
  * >http://localhost:9021/clusters
3. Verify the Jolokia Agent is coughing up JMX bean data.  This will show all the beans available for the _Kafka Broker_
Topic statistics exist in _confluent-metrix_
  * >http://localhost:8778/jolokia/list
4. Start Telegraf and Grafana
  * >docker-compose -f docker-compose-monitoring.yml
5. Verify Grafana is up.  The credentials are admin/admin
  * >http://localhost:3000/login

## Configuring Grafana
6. Create a data source that points at influxdb
  * The influxDB is located at > influxdb:8086
  * The database name is >Telegraf
7. Run Queries
  * _To be documented_

## References
See _sample-jolokia-beans.json_ for all the mbean data coughed up by Jolokia for a unadulterated Kafka broker