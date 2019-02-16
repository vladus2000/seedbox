FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yaourt -S --needed --noconfirm flac lame mp3gain sox vorbis-tools vorbisgain whatmp3 python2-notify python2-babel python2-cheetah python2-mako jackett python2-pip wget rsync unzip p7zip zip openssh rar sickchill couchpotato libglvnd ffmpeg' && \
	chown -R evil ~evil/shiz && \
	cp ~evil/shiz/startup.sh / && \
	chmod +x /startup.sh && \
	/rm-devel.sh

#su - evil -c 'git clone https://github.com/SiCKRAGETV/SiCKRAGE.git SickRage && cp ~/shiz/config.ini ~/sickrage' && \

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

CMD /bin/bash -c /startup.sh

VOLUME /home/evil/downloads
VOLUME /var/lib/couchpotato
VOLUME /var/lib/jackett
VOLUME /opt/sickchill

