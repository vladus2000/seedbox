su - evil -c 'mkdir -p ~evil/rtorrent/.session'
rm -f ~evil/rtorrent/.session/rtorrent.lock
/fixuser.sh evil
/fixuser.sh http evil
chmod -R ugo+rw /usr/share/webapps/rutorrent/share/settings
/fixuser.sh jackett evil
chown -R evil:evil /usr/lib/jackett /var/lib/jackett
/fixuser.sh sickchill evil
chown -R evil:evil /opt/sickchill
/fixuser.sh couchpotato evil
chown -R evil:evil /var/lib/couchpotato /run/couchpotato
/unevil.sh
php-fpm
nginx
su - evil -c 'screen -d -m -S rtorrent rtorrent'
su - evil -c 'screen -d -m -S irssi irssi'
su - evil -c 'screen -d -m -S sick python2 /opt/sickchill/app/SickBeard.py --quiet --nolaunch --datadir /opt/sickchill/data'
su - evil -c 'screen -d -m -S couch couchpotato --config_file /var/lib/couchpotato/config.ini --data_dir /var/lib/couchpotato --pid_file=/run/couchpotato/couchpotato.pid --console_log'
su - evil -c 'screen -d -m -S jackett /usr/bin/mono /usr/lib/jackett/JackettConsole.exe --DataFolder /var/lib/jackett'
while true
do
	sleep 1h
done
