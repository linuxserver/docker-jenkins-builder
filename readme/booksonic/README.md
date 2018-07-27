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

# [linuxserver/booksonic](https://github.com/linuxserver/docker-booksonic)
[![](https://images.microbadger.com/badges/version/linuxserver/booksonic.svg)](https://microbadger.com/images/linuxserverbooksonic "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/booksonic.svg)](https://microbadger.com/images/linuxserver/booksonic "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/booksonic.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/booksonic.svg)

[Booksonic](http://booksonic.org) is a server and an app for streaming your audiobooks to any pc or android phone. Most of the functionality is also availiable on other platforms that have apps for subsonic.

<a href="http://booksonic.org" rel="booksonic">![booksonic](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/booksonic.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=booksonic \
  -e PUID=1001 \
  -e PGID=1001 \
  -e CONTEXT_PATH=<url-base> \
  -p 4040:4040 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/media/books>:/books \
  -v </path/to/media/podcasts>:/podcasts \
  -v </path/to/media/>:/media \
  linuxserver/booksonic
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  booksonic:
    image: linuxserver/booksonic
    container_name: booksonic
    environment:
      - PUID=1001
      - PGID=1001
      - CONTEXT_PATH=<url-base>
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/media/books>:/books
      - </path/to/media/podcasts>:/podcasts
      - </path/to/media/>:/media
    ports:
      - 4040:4040
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 4040` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e CONTEXT_PATH=<url-base>` | for setting url-base in reverse proxy setups - *optional* |
| `-v /config` | Configuration files. |
| `-v /books` | Location of audiobooks. |
| `-v /podcasts` | Location of podcasts. |
| `-v /media` | Location of other media - *optional* |

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

* **06.12.17** - Rebase to alpine 3.7.
* **11.07.17** - Rebase to alpine 3.6.
* **07.02.17** - Rebase to alpine 3.5.
* **13.12.16** - Initial Release.
