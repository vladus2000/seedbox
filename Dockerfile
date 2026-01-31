FROM vladus2000/rutorrent
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/install-devel.sh && \
	su - evil -c 'yay -S --needed --noconfirm --removemake --cleanafter pyinstaller flac lame mp3gain sox vorbis-tools whatmp3 jackett-bin wget rsync unzip p7zip zip openssh rar libglvnd ffmpeg radarr-bin sonarr-bin su-exec par2cmdline nzbget python-sphinx streamlink-git' && \
	su - evil -c 'git clone https://aur.archlinux.org/pymedusa.git && cd pymedusa && sed -e s/pkgver=1.0.21/pkgver=1.0.25/ PKGBUILD > PKGBUILD2 && sed -e s/b0922e6186dfcc290d4f5425716cdad16bbfb52fd8012d9ada1af054673ad64c/75d86931d42a55fb2531e5d1dc6bd7ec140dba7b2a201457058f951a297c99c6/ PKGBUILD2 > PKGBUILD && git add PKGBUILD && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git commit -m "fucking a" && yay --noconfirm --noprogressbar -Bi . && cd .. && rm -rf pymedusa' && \
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
	/rm-devel.sh

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /downloads


	#su - evil -c 'yay -S --needed --noconfirm --removemake --cleanafter pyinstaller flac lame mp3gain sox vorbis-tools whatmp3 jackett-bin wget rsync unzip p7zip zip openssh rar libglvnd ffmpeg radarr-bin sonarr-bin su-exec pymedusa par2cmdline nzbget python-sphinx streamlink-git python311 mylar3' && \

	#su - evil -c 'git clone https://aur.archlinux.org/mylar3.git && cd mylar3 && sed -e s/pkgver=0.8.0/pkgver=0.8.3/ PKGBUILD > PKGBUILD2 && sed -e s/14bc2b0578f58f26f3b63958637f889573f7b5eee13ed4eaf75375f2a0faf678/ffb15cfc375590c872d0a6ce5fdc48323a94bdc623688c4598006aaf8edcdaa6/ PKGBUILD2 > PKGBUILD && git add PKGBUILD && git config --global user.email "you@example.com" && git config --global user.name "Your Name" && git commit -m "fucking a" && yay --noconfirm --noprogressbar -Bi . && cd .. && rm -rf mylar3' && \
	#pip install -r /usr/lib/mylar3/requirements.txt -t /usr/lib/mylar3/ && \
