FROM vladus2000/arch-yaourt-evil-base
MAINTAINER vladus2000 <docker@matt.land>

RUN su - evil -c 'yaourt -Syyu --needed --noconfirm;yaourt -S --needed --noconfirm rsync rtorrent geoip php-geoip plowshare unrar unzip rutorrent-git nginx irssi perl-archive-zip perl-digest-sha1 perl-html-parser perl-json perl-json-xs perl-net-ssleay perl-xml-libxml perl-xml-libxslt fcgi fcgiwrap spawn-fcgi screen'

RUN su - evil -c 'mkdir -p ~/.irssi/scripts/autorun;cd ~/.irssi/scripts;git init;git remote add origin https://github.com/autodl-community/autodl-irssi.git;git pull origin master;cp autodl-irssi.pl autorun/;mkdir -p ~/.autodl;touch ~/.autodl/autodl.cfg;touch ~/.rtorrent.rc'

RUN \
	cd /usr/share/webapps/rutorrent/plugins && \
	git clone https://github.com/autodl-community/autodl-rutorrent.git autodl-irssi && \
	cp autodl-irssi/_conf.php autodl-irssi/conf.php && \
	chown http:http -R autodl-irssi

COPY .rtorrent.rc /home/evil/
COPY autodl.cfg /home/evil/.autodl/
COPY conf.php /usr/share/webapps/rutorrent/plugins/autodl-irssi/
COPY nginx.conf /etc/nginx/
COPY startup.sh /

RUN chmod +x /startup.sh

EXPOSE 80
EXPOSE 49152

CMD /bin/bash -c /startup.sh

