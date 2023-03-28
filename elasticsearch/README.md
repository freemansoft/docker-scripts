# Purpose
* Manage three node Elasticsearch + Kibana in docker on local machines.
* Exists as docker-compose to make multi-node easier .
* Guide: https://www.elastic.co/guide/en/elastic-stack-get-started/master/get-started-docker.html

![Topology](./images_folder/elasticsearch-local-docker.svg)
Drawn with:  https://www.draw.io/?mode=github
Todo: Redraw this using mermaid.js

# Setup
1. Copy `.env.template` to `.env` and update with your property values
1. Run `docker-compose up`

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* Kibana web UI is on http://localhost:5601
* Installs analysis-icu and analysis-phonetic **on startup** and not in a Dockerfile.  This implies Internet access.

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.

# Troubleshooting max_map_count error
You may see this when running Docker in WSL/WSL2 on Microsoft Windows
`max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]`

The fix is to run this in the WSL Docker VM but how to do that? Probably the .wslconfig or wsl.conf file.
`sudo sysctl -w vm.max_map_count=262144`

This alternative works but needs to run every time you restart docker
`wsl -d docker-desktop sysctl -w vm.max_map_count=262144`

Discussions of this issue can be found here
* https://github.com/docker/for-win/issues/5202
* https://stackoverflow.com/questions/69214301/using-docker-desktop-for-windows-how-can-sysctl-parameters-be-configured-to-per/69294687#69294687