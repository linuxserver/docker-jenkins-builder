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

# [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping)
[![](https://images.microbadger.com/badges/version/linuxserver/smokeping.svg)](https://microbadger.com/images/linuxserversmokeping "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/smokeping.svg)](https://microbadger.com/images/linuxserver/smokeping "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/smokeping.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/smokeping.svg)

[Smokeping](https://oss.oetiker.ch/smokeping/) keeps track of your network latency. For a full example of what this application is capable of visit [UCDavis](http://smokeping.ucdavis.edu/cgi-bin/smokeping.fcgi).
* [Collaboration](https://github.com/Codiad/Codiad-Collaborative)
* [Terminal](https://github.com/Fluidbyte/Codiad-Terminal)
* [CodeGit](https://github.com/Andr3as/Codiad-CodeGit)
* [Drag and Drop](https://github.com/Andr3as/Codiad-DragDrop)

<a href="https://oss.oetiker.ch/smokeping/" rel="smokeping">![smokeping](https://camo.githubusercontent.com/e0694ef783e3fd1d74e6776b28822ced01c7cc17/687474703a2f2f6f73732e6f6574696b65722e63682f736d6f6b6570696e672f696e632f736d6f6b6570696e672d6c6f676f2e706e67)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=smokeping \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 80:80 \
  -v </path/to/smokeping/config>:/config \
  -v </path/to/smokeping/data>:/data \
  linuxserver/smokeping
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  smokeping:
    image: linuxserver/smokeping
    container_name: smokeping
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/smokeping/config>:/config
      - </path/to/smokeping/data>:/data
    ports:
      - 80:80
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | Allows HTTP access to the internal webserver. |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-v /config` | Configure the `Targets` file here |
| `-v /data` | Storage location for db and application data (graphs etc) |

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

* Shell access whilst the container is running: `docker exec -it smokeping /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f smokeping`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' smokeping`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/smokeping`

## Versions

* **09.12.17:** - Fix continuation lines.
* **12.07.17:** - Add inspect commands to README, move to jenkins build and push.
* **28.05.17:** - Add unrar package as per requests, for subzero plugin.
* **11.01.17:** - Use Plex environemt variables from pms docker, change abc home folder to /app to alleviate usermod chowning library folder by default (thanks gbooker, plexinc).
* **03.01.17:** - Use case insensitive version variable matching rather than export and make lowercase.
* **17.10.16:** - Allow use of uppercase version variable
* **01.10.16:** - Add TZ info to README.
* **09.09.16:** - Add layer badges to README.
* **27.08.16:** - Add badges to README.
* **22.08.16:** - Rebased to xenial and s6 overlay
* **07.04.16:** - removed `/transcode` volume support (upstream Plex change) and modified PlexPass download method to prevent unauthorised usage of paid PMS
* **24.09.15:** - added optional support for volume transcoding (/transcode), and various typo fixes.
* **17.09.15:** - Changed to run chmod only once
* **19.09.15:** - Plex updated their download servers from http to https
* **28.08.15:** - Removed plexpass from routine, and now uses VERSION as a combination fix.
* **18.07.15:** - Moved autoupdate to be hosted by linuxserver.io and implemented bugfix thanks to ljm42.
* **09.07.15:** - Now with ability to pick static version number.
* **08.07.15:** - Now with autoupdates. (Hosted by fanart.tv)
* **03.07.15:** - Fixed a mistake that allowed plex to run as user plex rather than abc (99:100). Thanks to double16 for spotting this.