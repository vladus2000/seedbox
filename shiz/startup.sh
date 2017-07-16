/fixuser.sh evil
/unevil.sh
php-fpm
nginx
su - evil -c 'screen -d -m -S rtorrent rtorrent'
su - evil -c 'screen -d -m -S irssi irssi'
su - evil -c 'screen -d -m -S sick python2 ~/SickRage/SickBeard.py --datadir /home/evil/sickrage'
su - evil -c 'screen -d -m -S couch python2 ~/CouchPotatoServer/CouchPotato.py'
su - evil -c 'screen -d -m -S jackett /usr/bin/mono --debug /opt/Jackett/JackettConsole.exe'
while true
do
	sleep 1h
done
