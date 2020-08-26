This project exposes _Kafka Topic_ metrics via JMX where they are picked up and stored in InfluxDB and exposed to user via Grafana.

Kakfa Brokers expose topic statistics two ways
* JMX Beans
* As messages in  _confluent-metrics_ topic

-----------------

## Run the Kafka cluster and the Monitoring cluster
1. Build a Kafka Broker Docker image with the _Jolokia_ Agent
  *  ``` bash build.sh ```
2. Start Kafka
  *  ```docker-compose -f docker-compose-kafka.yml```
3. Verify *Kakfa* is up by looking at the Confluent Dashboard
  * http://localhost:9021/clusters/
3. Verify the *Jolokia Agent) is coughing up JMX bean data.  
This will show all the beans available exposed by the _Kafka Broker_
All MBean data is exposed to the Jolokia REST endpoint. Topic statistics should exist for each topic.  
  * http://localhost:8778/jolokia/list
4. Start the monitoring ecosystem - Telegraf, InfluxDB and Grafana
  * ```docker-compose -f docker-compose-monitoring.yml```
5. Verify the _Grafana_ UI is up.  The credentials are _admin/admin_
  * http://localhost:3000/login 

-----------------

## Generate Test data in Kafka using Datagen
See this page >https://docs.confluent.io/current/quickstart/ce-quickstart.html The following is a poor cheatsheet
1. Open Browser 
      http://localhost:9021/clusters/ 
1. Create a topic named _pageviews_
      ```Cluster1 --> Topics --> _+ Add a Topic_ --> name it _pageviews_ --> Press _Create with Defaults_ ```
1. Create a topic named _users_
      ```Cluster1 --> Topics --> _+ Add a Topic_ --> name it _users_ --> Press _Create with Defaults_ ```
1. Generate test data using the console and the datagen source
    * pageviews 
    1. Connect to Web Console
    1. Connect to Datagen Connector
       * Connect ```Clusters > Connect> connect-default >```
       * You will be on the connectors page
       * Press _Add Connector_ on the right
       * Find then button _DatagenConnector_ press _Connect_
    1. Set the name to _datagent-pageviews_
    1. On the next page _Add Connector_
        * Key converter class field, -> org.apache.kafka.connect.storage.StringConverter.
        * kafka.topic field ->  pageviews.
        * max.interval field ->  100. 
        * quickstart field ->  pageviews.
    1. Click Continue
    1. Review the connector configuration and click _launch_
    * users 
    1. Connect to Web Console
       * Connect ```Clusters > Connect> connect-default >``
       * You will be on the connectors page
       * Press _Add Connector_ on the right
       * Find the button _DatagenConnector_ press _Connect_
    1. Set the name to _datagen-users_
    1. On the next page _Add Connector_
        * Key converter class field, -> org.apache.kafka.connect.storage.StringConverter.
        * kafka.topic field ->  users
        * max.interval field ->  100 
        * quickstart field ->  users
    1. Click Continue
    1. Review the connector configuration and click _launch_
1. Verify 2 connectors running
    * ```Cluster 1 --> connect --> connect-default```
 
-----------------
## Configure Grafana
1. Connect to the grafana dashboard
    * http://localhost:3000/login
    * admin/admin
    * skip the offered password change
1. Click on _add data source_
1. Click on influxDB to start the connection creation
1. Create a data source that points at influxdb
    * Url:  http://influxdb:8086
    * Database: telegraf
    * Leave everything else blank
1. Click _Save and Test_

You can view the datasource configuration via the rest api
   http://localhost:3000/api/datasources/ 

## Run Grafana Queries
1. In the Grafana dashboard
    * Click on _Explor_ in the left menu
1. Make sure the DB droplist at the top is set to _InfluxDB_
1. On the _FROM_ line
    * Change the from to the desired metric like _cpu_ or _kafka\_topics_
1. On the _Select_ line
    * Change the field value to the metric you want to see
1. Click on _Run Query_

Example: *FROM* _default_ _mem_ *WHERE* *SELECT* field(active) mean() *GROUP BY* time($_interval...) *FORMAT AS* Time series

-----------------
## Cleanup 
1. Brinkdown monitoring
  * ```docker-compose -f docker-compose-monitory.yml down ```
1. Bring down kafka
  * ```docker-compose -f docker-compose-kafka.yml down ```
3. If you only control-c the open windows then you may need
  * ```docker container prune ```

-----------------
## References
* See _sample-jolokia-beans.json_ for all the mbean data coughed up by Jolokia for a unadulterated Kafka broker
* Jolokia / Telegraf sample config https://telegraf-kafka.readthedocs.io/en/stable/kafka_monitoring.html
* Jolokia / Telegraf sample config https://docs.wavefront.com/kafka.html
* Datagen data generator demo https://docs.confluent.io/current/quickstart/ce-quickstart.html

-----------------

You should be abel to Create a grafana database confguration by sending a POST to http://localhost:3000/api/datasources
```
{
  "name": "InfluxDB",
  "type": "influxdb",
  "url": "http://influxdb:8086",
  "database": "telegraf",
}
```
@see https://grafana.com/docs/grafana/latest/http_api/data_source/
