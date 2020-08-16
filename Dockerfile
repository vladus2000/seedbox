FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm pyinstaller-git python2-setuptools flac lame mp3gain sox vorbis-tools vorbisgain whatmp3 jackett wget rsync unzip p7zip zip openssh rar libglvnd ffmpeg radarr sonarr su-exec mylar3 pymedusa par2cmdline nzbget streamlink-git' && \
	su - evil -c 'git clone https://github.com/Instinctlol/automatic-twitch-recorder.git -b webhooks atr' && \
	pip install -r /home/evil/atr/requirements.txt && \
	chown -R evil:evil ~evil/shiz && \
	cp ~evil/shiz/*.sh / && \
	cp ~evil/shiz/nzbget.conf /config && \
	chmod +x /*.sh && \
	rm -rf /var/lib/{jackett,radarr,sonarr,mylar,pymedusa,atr} && \
	su - evil -c 'mkdir -p /config/{jackett,radarr,sonarr,mylar,pymedusa,atr}' && \
	ln -s /config/jackett /var/lib/jackett && \
	ln -s /config/radarr /var/lib/radarr && \
	ln -s /config/sonarr /var/lib/sonarr && \
	ln -s /config/mylar /var/lib/mylar && \
	ln -s /config/pymedusa /var/lib/pymedusa && \
	ln -s /config/nzbget.conf ~evil/.nzbget && \
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /downloads

