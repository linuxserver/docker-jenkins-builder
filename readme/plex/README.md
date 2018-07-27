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

# linuxserver/plex
[![](https://images.microbadger.com/badges/version/linuxserver/plex.svg)](https://microbadger.com/images/linuxserverplex "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/plex.svg)](https://microbadger.com/images/linuxserver/plex "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/plex.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/plex.svg)

[Plex](https://plex.tv/) organizes video, music and photos from personal media libraries and streams them to smart TVs, streaming boxes and mobile devices. This container is packaged as a standalone Plex Media Server.

<a href="https://plex.tv/" rel="plex">![plex](http://the-gadgeteer.com/wp-content/uploads/2015/10/plex-logo-e1446990678679.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=plex \
  --net=host \
  -e PUID=1001 \
  -e PGID=1001 \
  -e VERSION=latest \
  -e TZ=Europe/London \
  -v </path/to/plex/library>:/config \
  -v </path/to/tvseries>:/data/tv \
  -v </path/to/movies>:/data/movies \
  -v </path/for/transcoding>:/transcode \
  linuxserver/plex
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  plex:
    image: linuxserver/plex
    container_name: plex
    network_mode: host
    environment:
      - PUID=1001
      - PGID=1001
      - VERSION=latest
      - TZ=Europe/London
    volumes:
      - </path/to/plex/library>:/config
      - </path/to/tvseries>:/data/tv
      - </path/to/movies>:/data/movies
      - </path/for/transcoding>:/transcode
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Parameters are split into two halves with the left hand side representing the host and the right the container side. The colon acts as a separator between them.
For example with a port `-p external:internal` - what this shows is the port mapping from the inside to the outside of the container.
For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080`
http://192.168.x.x:8080 would show you what's running inside the container on port 80.


| Parameter | Function |
| :----: | --- |
| `--net=host` | Shares host networking with container. |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e VERSION=latest` | Supported values are LATEST, PLEXPASS or a specific version number. |
| `-e TZ=Europe/London` | *Optional* Timezone. |
| `-v /config` | Plex metadata location. Budget at 50gb- of disk space for large libraries. An SSD is perferred. |
| `-v /data/tv` | Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc. |
| `-v /data/movies` | Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc. |
| `-v /transcode` | Path for transcoding folder, *optional*. |


&nbsp;

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and it will "just work" &trade;.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

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
