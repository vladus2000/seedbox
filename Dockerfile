FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm flac lame mp3gain sox vorbis-tools vorbisgain whatmp3 python2-notify python2-babel python2-cheetah python2-mako jackett python2-pip wget rsync unzip p7zip zip openssh rar sickchill couchpotato libglvnd ffmpeg radarr sonarr su-exec mylar-git pymedusa par2cmdline nzbget watcher3' && \
	chown -R evil:evil ~evil/shiz && \
	cp ~evil/shiz/*.sh / && \
	cp ~evil/shiz/nzbget.conf /config && \
	chmod +x /*.sh && \
	rm -rf /var/lib/{couchpotato,jackett,radarr,sonarr,mylar,pymedusa} /opt/sickchill/data /opt/watcher3/userdata && \
	su - evil -c 'mkdir -p /config/{couchpotato,jackett,radarr,sonarr,mylar,pymedusa,sickchill,watcher}' && \
	ln -s /config/couchpotato /var/lib/couchpotato && \
	ln -s /config/jackett /var/lib/jackett && \
	ln -s /config/sickchill /opt/sickchill/data && \
	ln -s /config/radarr /var/lib/radarr && \
	ln -s /config/sonarr /var/lib/sonarr && \
	ln -s /config/mylar /var/lib/mylar && \
	ln -s /config/pymedusa /var/lib/pymedusa && \
	ln -s /config/nzbget.conf ~evil/.nzbget && \
	ln -s /config/watcher /opt/watcher3/userdata && \
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /downloads

