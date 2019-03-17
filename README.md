# seedbox

VOLUME /home/evil/downloads

VOLUME /home/evil/rtorrent

VOLUME /usr/share/webapps/rutorrent/share/settings

VOLUME /var/lib/couchpotato

VOLUME /var/lib/jackett

VOLUME /opt/sickchill/data

VOLUME /var/lib/radarr

VOLUME /var/lib/sonarr

/home/evil/.rtorrent.rc

/home/evil/.autodl/autodl.cfg

EXPOSE 8069 for nginx, use /rutorrent /sickchill etc

EXPOSE 49152 for rtorrent

set PUID and PGID to the user/group ids you want to use.

The following vars control what runs:

RUN\_COUCHPOTATO

RUN\_SICKCHILL

RUN\_JACKETT

RUN\_RADARR

RUN\_SONARR

