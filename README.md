# seedbox

VOLUME /config

VOLUME /downloads

EXPOSE 8069 for nginx, use /rutorrent /sickchill etc

EXPOSE 49152 for rtorrent

set PUID and PGID to the user/group ids you want to use.

The following vars control what runs:

RUN\_ALL to run everything, or:

RUN\_COUCHPOTATO

RUN\_SICKCHILL

RUN\_JACKETT

RUN\_RADARR

RUN\_SONARR

RUN\_MYLAR

RUN\_PYMEDUSA

RUN\_NZBGET

