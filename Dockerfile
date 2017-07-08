FROM vladus2000/arch-yaourt-evil-base
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	echo >> /etc/pacman.conf && \
	echo '[aur-archlinux]' >> /etc/pacman.conf && \
	echo 'SigLevel = Never' >> /etc/pacman.conf && \
	echo 'Server = https://repo.itmettke.de/aur/$repo/$arch' >> /etc/pacman.conf && \
	su - evil -c 'yaourt -Syyu --needed --noconfirm && yaourt -S --needed --noconfirm rsync rtorrent geoip php-geoip plowshare mktorrent nginx irssi perl-archive-zip perl-digest-sha1 perl-html-parser perl-json perl-json-xs perl-net-ssleay perl-xml-libxml perl-xml-libxslt fcgi fcgiwrap spawn-fcgi screen php-fpm flac lame mp3gain sox vorbis-tools vorbisgain whatmp3 mediainfo ffmpeg python2-notify python2-babel python2-cheetah python2-mako rar' && \
	pacman -U --needed --noconfirm https://archive.archlinux.org/packages/p/python2/python2-2.7.12-2-x86_64.pkg.tar.xz && \
	pacman -S --needed --noconfirm openssl-1.0 && \
	chown -R evil ~evil/shiz && \
	su - evil -c 'mkdir -p ~/.irssi/scripts/autorun ~/sickrage && cd ~/.irssi/scripts && git init && git remote add origin https://github.com/autodl-community/autodl-irssi.git && git pull origin master && cp autodl-irssi.pl autorun/ && mkdir -p ~/.autodl && cp ~/shiz/autodl.cfg ~/.autodl/autodl.cfg && cp ~/shiz/.rtorrent.rc ~/.rtorrent.rc && mkdir -p ~/rtorrent/.session' && \
	su - evil -c 'git clone https://github.com/SickRage/SickRage.git && cp ~/shiz/config.ini ~/sickrage' && \
	su - evil -c 'git clone https://github.com/CouchPotato/CouchPotatoServer.git && mkdir ~/.couchpotato && cp ~/shiz/settings.conf ~/.couchpotato/.' && \
	mkdir -p /usr/share/webapps && \
	cd /usr/share/webapps && \
	git clone https://github.com/Novik/ruTorrent.git && \
	mv ruTorrent rutorrent && \
	cd /usr/share/webapps/rutorrent/plugins && \
	git clone https://github.com/autodl-community/autodl-rutorrent.git autodl-irssi && \
	cp autodl-irssi/_conf.php autodl-irssi/conf.php && \
	cd /usr/share/webapps/ && \
	cp ~evil/shiz/conf.php /usr/share/webapps/rutorrent/plugins/autodl-irssi/ && \
	cp ~evil/shiz/config.php /usr/share/webapps/rutorrent/conf/ && \
	cp ~evil/shiz/startup.sh / && \
	cp ~evil/shiz/nginx.conf /etc/nginx/ && \
	chmod +x /startup.sh && \
	sed -e 's/;extension=sockets/extension=sockets/' /etc/php/php.ini > /php.ini && \
	mv /php.ini /etc/php/php.ini && \
	chown http:http -R rutorrent && \
	rm -rf /var/cache/pacman/pkg/*

EXPOSE 8069
EXPOSE 49152

CMD /bin/bash -c /startup.sh

