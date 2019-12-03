Manage three node Elasticsearch + Kibana in docker on local machines. 
* Guide https://www.elastic.co/guide/en/elastic-stack-get-started/master/get-started-docker.html

**Features**
* Creates named volumes to persist across restarts.  
* The Kiban web UI is on http://localhost/5601

**Usage**
| command  | Purpose  |
|---|---|
| docker-compose up             | bring up services attached to the logs using existing images |
| docker-compose up -d --build  | bring up services detached building new imsages |
| docker-compose down           | bring down services  | 

**Purpose**
Exists as docker compose to make multi-node easier .