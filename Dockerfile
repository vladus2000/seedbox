FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm --removemake --cleanafter flac lame mp3gain sox vorbis-tools whatmp3 jackett-bin rsync unzip p7zip zip openssh rar libglvnd ffmpeg radarr-bin sonarr-bin su-exec par2cmdline nzbget python-sphinx streamlink python311' && \
	chown -R evil:evil ~evil/shiz && \
	cp ~evil/shiz/*.sh / && \
	cp ~evil/shiz/nzbget.conf /config && \
	chmod +x /*.sh && \
	rm -rf /var/lib/{jackett,radarr,sonarr,mylar,pymedusa} && \
	su - evil -c 'mkdir -p /config/{jackett,radarr,sonarr,mylar,pymedusa}' && \
	ln -s /config/jackett /var/lib/jackett && \
	ln -s /config/radarr /var/lib/radarr && \
	ln -s /config/sonarr /var/lib/sonarr && \
	ln -s /config/mylar /var/lib/mylar && \
	ln -s /config/pymedusa /var/lib/pymedusa && \
	ln -s /config/nzbget.conf ~evil/.nzbget && \
	su - evil -c 'git clone https://github.com/pymedusa/Medusa && python3.11 -m venv Medusa && cd Medusa && . bin/activate && pip install -r requirements.txt' && \
	su - evil -c 'git clone https://github.com/mylar3/mylar3 && python3.11 -m venv mylar3 && cd mylar3 && . bin/activate && pip install -r requirements.txt' && \
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /downloads

