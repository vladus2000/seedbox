# seedbox

VOLUME /home/evil/downloads
VOLUME /home/evil/rtorrent
VOLUME /usr/share/webapps/rutorrent/share/settings
VOLUME /var/lib/couchpotato
VOLUME /var/lib/jackett
VOLUME /opt/sickchill/data

/home/evil/.rtorrent.rc
/home/evil/.autodl/autodl.cfg

# for couchpotato
EXPOSE 5050
# for rutorrent (via nginx)
EXPOSE 8069
# for sickchill
EXPOSE 8081
# for jackett
EXPOSE 9117
# for rtorrent
EXPOSE 49152

