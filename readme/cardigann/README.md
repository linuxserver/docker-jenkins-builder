<a href="https://linuxserver.io" rel="linuxserver.io">![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)</a>

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://podcast.linuxserver.io) - on hiatus. Coming back soon (late 2018).

# [linuxserver/cardigann](https://github.com/linuxserver/docker-cardigann)
[![](https://images.microbadger.com/badges/version/linuxserver/cardigann.svg)](https://microbadger.com/images/linuxservercardigann "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/cardigann.svg)](https://microbadger.com/images/linuxserver/cardigann "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/cardigann.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/cardigann.svg)

[Cardigann](https://github.com/cardigann/cardigann) is a server for adding extra indexers to Sonarr, SickRage and CouchPotato via Torznab and TorrentPotato proxies. Behind the scenes Cardigann logs in and runs searches and then transforms the results into a compatible format. 

<a href="https://github.com/cardigann/cardigann" rel="cardigann">![cardigann](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/cardigann.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=cardigann \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 5060:5060 \
  -v </path/to/appdata/config>:/config \
  linuxserver/cardigann
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  cardigann:
    image: linuxserver/cardigann
    container_name: cardigann
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/appdata/config>:/config
    ports:
      - 5060:5060
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 5060` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-v /config` | Configuration files. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

## Reverse Proxy Snippet

This snippet has been tested with Linuxserver.io's [Let's Encrypt reverse proxy](https://github.com/linuxserver/docker-letsencrypt) container.
- Configure via the webui at `<your-ip>:5060`
- By adding a variable to the run command, `SOCKS_PROXY` or `HTTP_PROXY` cardigann can be used with a proxy, *eg* `-e SOCKS_PROXY=localhost:1080`
- The folder /config/definitions can be used to add additional tracker definitions (for more info see [Additional definitions](https://github.com/cardigann/cardigann#definitions)


## Support Info

* Shell access whilst the container is running: `docker exec -it cardigann /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f cardigann`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' cardigann`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/cardigann`

## Versions

* **06.05.18:** - Use buildstage in Dockerfile.
* **06.12.17:** - Rebase to alpine 3.7.
* **12.08.17:** - Add npm install to build stage.
* **25.05.17:** - Rebase to alpine 3.6.
* **07.02.17:** - Rebase to alpine 3.5.
* **03.11.16:** - Compiled using [sstamoulis'](https://github.com/sstamoulis) method
* **01.11.16:** - Initial Release.
