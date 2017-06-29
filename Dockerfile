FROM vladus2000/arch-yaourt-evil-base
MAINTAINER vladus2000 <docker@matt.land>
RUN su - evil -c 'yaourt -S --needed --noconfirm rsync rtorrent-git geoip php-geoip plowshare unrar unzip rutorrent-git nginx irssi perl-archive-zip perl-digest-sha1 perl-html-parser perl-json perl-json-xs perl-net-ssleay perl-xml-libxml perl-xml-libxslt'

