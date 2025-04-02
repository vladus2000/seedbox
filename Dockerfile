FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm --removemake --cleanafter pyinstaller flac lame mp3gain sox vorbis-tools whatmp3 jackett-bin wget rsync unzip p7zip zip openssh rar libglvnd ffmpeg radarr-bin sonarr-bin su-exec pymedusa par2cmdline nzbget python-sphinx streamlink-git python311' && \
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
	su - evil -c 'git clone https://aur.archlinux.org/mylar3.git && cd mylar3 && sed -e s/pkgver=0.8.0/pkgver=0.8.2/ PKGBUILD > PKGBUILD2 && sed -e s/14bc2b0578f58f26f3b63958637f889573f7b5eee13ed4eaf75375f2a0faf678/38657834bc7daa91ad282a64f83f0dec1cfa370d9ff5844525a4a45dc22310ce/ PKGBUILD2 > PKGBUILD && git add PKGBUILD && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git commit -m "fucking a" && yay --noconfirm --noprogressbar -Bi . && cd .. && rm -rf mylar3' && \
	pip install -r /usr/lib/mylar3/requirements.txt -t /usr/lib/mylar3/ && \
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /downloads

