# seedbox

VOLUME /home/evil/downloads

VOLUME /home/evil/rtorrent

VOLUME /usr/share/webapps/rutorrent/share/settings

VOLUME /var/lib/couchpotato

VOLUME /var/lib/jackett

VOLUME /opt/sickchill/data

/home/evil/.rtorrent.rc

/home/evil/.autodl/autodl.cfg

EXPOSE 5050 for couchpotato

EXPOSE 8069 for rutorrent (via nginx)

EXPOSE 8081 for sickchill

EXPOSE 9117 for jackett

EXPOSE 49152 for rtorrent

