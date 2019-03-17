FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm flac lame mp3gain sox vorbis-tools vorbisgain whatmp3 python2-notify python2-babel python2-cheetah python2-mako jackett python2-pip wget rsync unzip p7zip zip openssh rar sickchill couchpotato libglvnd ffmpeg radarr sonarr' && \
	chown -R evil:evil ~evil/shiz && \
	cp ~evil/shiz/*.sh / && \
	chmod +x /*.sh && \
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /home/evil/downloads
VOLUME /home/evil/rtorrent
VOLUME /usr/share/webapps/rutorrent/share/settings
VOLUME /var/lib/couchpotato
VOLUME /var/lib/jackett
VOLUME /opt/sickchill/data
VOLUME /var/lib/radarr
VOLUME /var/lib/sonarr

#TODO: fix reverse proxy in apps
