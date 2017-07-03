FROM vladus2000/arch-yaourt-evil-base
MAINTAINER vladus2000 <docker@matt.land>

COPY rar/ /home/evil/rar/

RUN su - evil -c 'yaourt -Syyu --needed --noconfirm;yaourt -S --needed --noconfirm rsync rtorrent geoip php-geoip plowshare mktorrent nginx irssi perl-archive-zip perl-digest-sha1 perl-html-parser perl-json perl-json-xs perl-net-ssleay perl-xml-libxml perl-xml-libxslt fcgi fcgiwrap spawn-fcgi screen php-fpm flac lame mp3gain sox vorbis-tools vorbisgain whatmp3' && \
	chown -R evil ~evil/rar && \
	su - evil -c 'mkdir -p ~/.irssi/scripts/autorun;cd ~/.irssi/scripts;git init;git remote add origin https://github.com/autodl-community/autodl-irssi.git;git pull origin master;cp autodl-irssi.pl autorun/;mkdir -p ~/.autodl;touch ~/.autodl/autodl.cfg;touch ~/.rtorrent.rc;mkdir -p ~/rtorrent/.session;cd ~/rar;makepkg -si --noconfirm' && \
	mkdir -p /usr/share/webapps && \
	cd /usr/share/webapps && \
	git clone https://github.com/Novik/ruTorrent.git && \
	mv ruTorrent rutorrent && \
	cd /usr/share/webapps/rutorrent/plugins && \
	git clone https://github.com/autodl-community/autodl-rutorrent.git autodl-irssi && \
	cp autodl-irssi/_conf.php autodl-irssi/conf.php && \
	cd /usr/share/webapps/ && \
	chown http:http -R rutorrent && \
	rm -rf /var/cache/pacman/pkg/* && \
	rm -rf /home/evil/rar

COPY .rtorrent.rc /home/evil/
COPY autodl.cfg /home/evil/.autodl/
COPY conf.php /usr/share/webapps/rutorrent/plugins/autodl-irssi/
COPY config.php /usr/share/webapps/rutorrent/conf/
COPY nginx.conf /etc/nginx/
COPY startup.sh /

RUN chmod +x /startup.sh && \
	sed -e 's/;extension=sockets/extension=sockets/' /etc/php/php.ini > /php.ini && \
	mv /php.ini /etc/php/php.ini && \

EXPOSE 8069
EXPOSE 49152

CMD /bin/bash -c /startup.sh

