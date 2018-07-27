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

# [linuxserver/codiad](https://github.com/linuxserver/docker-codiad)
[![](https://images.microbadger.com/badges/version/linuxserver/codiad.svg)](https://microbadger.com/images/linuxservercodiad "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/codiad.svg)](https://microbadger.com/images/linuxserver/codiad "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/codiad.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/codiad.svg)

[Codiad](http://codiad.com/) is a web-based IDE framework with a small footprint and minimal requirements. We have added a few plugins, more can be added in the marketplace in the WebUI.
* [Collaboration](https://github.com/Codiad/Codiad-Collaborative)
* [Terminal](https://github.com/Fluidbyte/Codiad-Terminal)
* [CodeGit](https://github.com/Andr3as/Codiad-CodeGit)
* [Drag and Drop](https://github.com/Andr3as/Codiad-DragDrop)

<a href="http://codiad.com/" rel="codiad">![codiad](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/codiad.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=codiad \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 80:80 \
  -v </path/to/appdata/config>:/config \
  linuxserver/codiad
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  codiad:
    image: linuxserver/codiad
    container_name: codiad
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/appdata/config>:/config
    ports:
      - 80:80
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | Application WebUI |
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

## Support Info

* Shell access whilst the container is running: `docker exec -it codiad /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f codiad`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' codiad`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/codiad`

## Versions

* **09.01.18** - Rebase to alpine linux 3.7.
* **25.05.17** - Rebase to alpine linux 3.6.
* **18.02.17** - Rebase to alpine linux 3.5.
* **14.10.16** - Add version layer information.
* **10.09.16** - Add layer badges to README
* **06.11.15** - Initial Release
