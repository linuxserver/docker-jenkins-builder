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

# [linuxserver/clarkson](https://github.com/linuxserver/docker-clarkson)
[![](https://images.microbadger.com/badges/version/linuxserver/clarkson.svg)](https://microbadger.com/images/linuxserverclarkson "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/clarkson.svg)](https://microbadger.com/images/linuxserver/clarkson "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/clarkson.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/clarkson.svg)

[Clarkson](https://github.com/linuxserver/Clarkson) is a web-based dashboard application that gives you a neat and clean interface for logging your fuel fill-ups for all of your vehicles. The application has full multi-user support, as well as multiple vehicles per user. Whenever you fill-up your car or motorcycle, keep the receipt and record the data in Clarkson.

<a href="https://github.com/linuxserver/Clarkson" rel="clarkson">![clarkson](https://raw.githubusercontent.com/linuxserver/Clarkson/master/docs/dashboard.png)</a>

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=clarkson \
  -e PUID=1001 \
  -e PGID=1001 \
  -e MYSQL_HOST=db-host \
  -e MYSQL_USERNAME=db-user \
  -e MYSQL_PASSWORD=db-pass \
  -e ENABLE_REGISTRATIONS=_true_ \
  -p 3000:3000 \
  linuxserver/clarkson
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  clarkson:
    image: linuxserver/clarkson
    container_name: clarkson
    environment:
      - PUID=1001
      - PGID=1001
      - MYSQL_HOST=db-host
      - MYSQL_USERNAME=db-user
      - MYSQL_PASSWORD=db-pass
      - ENABLE_REGISTRATIONS=_true_
    ports:
      - 3000:3000
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 3000` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e MYSQL_HOST=db-host` | Points the backend to the MySQL database. This can be either a docker hostname or an IP |
| `-e MYSQL_USERNAME=db-user` | The user with access to the _clarkson_ schema |
| `-e MYSQL_PASSWORD=db-pass` | The password for the DB user |
| `-e ENABLE_REGISTRATIONS=_true_` | If set to _true_, allows new users to register |

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

**Please ensure MySQL is running before starting this container**.
&nbsp;
It is preferred if you create the `clarkson` schema before initially running the container, then creating a user with granted permissions for the schema. Creating the schema before running the app is important as the `clarkson` user will not have permission to create the schema on your behalf. You can, of course, use the `root` user, which has the ability to create schemas automatically, but this is not recommended.
<br/>
```sql
CREATE SCHEMA `clarkson`;"
CREATE USER 'clarkson_user' IDENTIFIED BY 'supersecretpassword';
GRANT ALL ON `clarkson`.* TO 'clarkson_user';
```
<br/>
Once running, the container will run an initial MySQL migration, which populates the schema with all tables and procedures. The application will start immediately afterwards. You will need to register an initial user, of which will be the admin of the application. All subsequent users will be standard users. You can disable registrations after the fact by recreating the container with the `ENABLE_REGISTRATIONS` flag set to `false`. This will not hide the register link, but will disable the functionality.


## Support Info

* Shell access whilst the container is running: `docker exec -it clarkson /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f clarkson`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' clarkson`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/clarkson`

## Versions

* **19.02.18** - Initial release.
