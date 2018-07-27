<a href="https://linuxserver.io" rel="linuxserver.io">![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)</a>

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime chat with the community and the team.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`
* [Podcast](https://podcast.linuxserver.io) - covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/plex
![](https://images.microbadger.com/badges/version/linuxserver/plex.svg)(https://microbadger.com/images/linuxserverplex "Get your own version badge on microbadger.com")
![](https://images.microbadger.com/badges/image/linuxserver/plex.svg)(https://microbadger.com/images/linuxserver/plex "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/plex.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/plex.svg)

[Plex](https://plex.tv/) organizes video, music and photos from personal media libraries and streams them to smart TVs, streaming boxes and mobile devices. This container is packaged as a standalone Plex Media Server.

<a href="https://plex.tv/" rel="plex">![plex](http://the-gadgeteer.com/wp-content/uploads/2015/10/plex-logo-e1446990678679.png)</a>

## Versions

* **09.12.17:** - Fix continuation lines.
* **12.07.17:** -  Add inspect commands to README, move to jenkins build and push.
* **28.05.17:** -  Add unrar package as per requests, for subzero plugin.
* **11.01.17:** -  Use Plex environemt variables from pms docker, change abc home folder to /app to alleviate usermod chowning library folder by default (thanks gbooker, plexinc).
* **03.01.17:** -  Use case insensitive version variable matching rather than export and make lowercase.
* **17.10.16:** -  Allow use of uppercase version variable
* **01.10.16:** -  Add TZ info to README.
* **09.09.16:** -  Add layer badges to README.
* **27.08.16:** -  Add badges to README.
* **22.08.16:** -  Rebased to xenial and s6 overlay
* **07.04.16:** -  removed `/transcode` volume support (upstream Plex change) and modified PlexPass download method to prevent unauthorised usage of paid PMS
* **24.09.15:** -  added optional support for volume transcoding (/transcode), and various typo fixes.
* **17.09.15:** -  Changed to run chmod only once
* **19.09.15:** -  Plex updated their download servers from http to https
* **28.08.15:** -  Removed plexpass from routine, and now uses VERSION as a combination fix.
* **18.07.15:** -  Moved autoupdate to be hosted by linuxserver.io and implemented bugfix thanks to ljm42.
* **09.07.15:** -  Now with ability to pick static version number.
* **08.07.15:** -  Now with autoupdates. (Hosted by fanart.tv)
* **03.07.15:** -  Fixed a mistake that allowed plex to run as user plex rather than abc (99:100). Thanks to double16 for spotting this.
