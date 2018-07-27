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

# [linuxserver/calibre-web](https://github.com/linuxserver/docker-calibre-web)
[![](https://images.microbadger.com/badges/version/linuxserver/calibre-web.svg)](https://microbadger.com/images/linuxservercalibre-web "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/calibre-web.svg)](https://microbadger.com/images/linuxserver/calibre-web "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/calibre-web.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/calibre-web.svg)

[Calibre-web](https://github.com/janeczku/calibre-web) is a web app providing a clean interface for browsing, reading and downloading eBooks using an existing Calibre database.   It is also possible to integrate google drive and edit metadata and your calibre library through the app itself.

<a href="https://github.com/janeczku/calibre-web" rel="calibre-web">![calibre-web](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/calibre-web-icon.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=calibre-web \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 8083:8083 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/books>:/books \
  linuxserver/calibre-web
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  calibre-web:
    image: linuxserver/calibre-web
    container_name: calibre-web
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/books>:/books
    ports:
      - 8083:8083
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8083` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-v /config` | Configuration files. |
| `-v /books` | Location of media |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;
## Application Setup

- Webui can be found at `http://<your-ip>:8083`
- On the initial setup screen, enter `/books` as your calibre library location.
- Default user/pass is admin/admin123.


## Reverse Proxy Snippet

This snippet has been tested with Linuxserver.io's [Let's Encrypt reverse proxy](https://github.com/linuxserver/docker-letsencrypt) container.
```	
location /calibre-web {
        proxy_pass              http://<your-ip>:8083;
        proxy_set_header        Host            $http_host;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header        X-Scheme        $scheme;
        proxy_set_header        X-Script-Name   /calibre-web;
}
```


## Support Info

* Shell access whilst the container is running: `docker exec -it calibre-web /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f calibre-web`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' calibre-web`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/calibre-web`

## Versions

* **03.07.18:** - New build pushed, all versions below `67` have [vulnerability](https://github.com/janeczku/calibre-web/issues/534)
* **05.01.18:** - Deprecate cpu_core routine lack of scaling.
* **06.12.17:** - Rebase to alpine 3.7.
* **27.11.17:** - Use cpu core counting routine to speed up build time.
* **24.07.17:** - Curl version for imagemagick.
* **17.07.17:** - Initial release.
