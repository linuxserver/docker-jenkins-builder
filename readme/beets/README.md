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

# [linuxserver/beets](https://github.com/linuxserver/docker-beets)
[![](https://images.microbadger.com/badges/version/linuxserver/beets.svg)](https://microbadger.com/images/linuxserverbeets "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/beets.svg)](https://microbadger.com/images/linuxserver/beets "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/beets.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/beets.svg)

[Beets](http://beets.io/) is a music library manager and not, for the most part, a music player. It does include a simple player plugin and an experimental Web-based player, but it generally leaves actual sound-reproduction to specialized tools.

<a href="http://beets.io/" rel="beets">![beets](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/beets-icon.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=beets \
  -e PUID=1001 \
  -e PGID=1001 \
  -p 8337:8337 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/music>:/music \
  -v </path/to/downloads>:/downloads \
  linuxserver/beets
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  beets:
    image: linuxserver/beets
    container_name: beets
    environment:
      - PUID=1001
      - PGID=1001
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/music>:/music
      - </path/to/downloads>:/downloads
    ports:
      - 8337:8337
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
| `-p 8337` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-v /config` | Configuration files |
| `-v /music` | Music library location |
| `-v /downloads` | Non-processed music |


&nbsp;

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

## Versions

* **04.03.18"** - Upgrade mp3gain to 1.6.1.
* **02.01.18** - Deprecate cpu_core routine lack of scaling.
* **27.12.17** - Add beautifulsoup4 pip package.
* **06.12.17** - Rebase to alpine linux 3.7.
* **25.05.17** - Rebase to alpine linux 3.6.
* **06.02.17** - Rebase to alpine linux 3.5.
* **16.01.17** - Add packages required for replaygain.
* **24.12.16** - Add [beets-copyartifacts](https://github.com/sbarakat/beets-copyartifacts) plugin.
* **07.12.16** - Edit cmake options for chromaprint, should now build and install fpcalc, add gstreamer lib
* **14.10.16** - Add version layer information.
* **01.10.16** - Add nano and editor variable to allow editing of the config from the container command line.
* **30.09.16** - Fix umask.
* **24.09.16** - Rebase to alpine linux.
* **10.09.16** - Add layer badges to README.
* **05.01.16** - Change ffpmeg repository, other version crashes container
* **06.11.15** - Initial Release
* **29.11.15** - Take out term setting, causing issues with key entry for some users
