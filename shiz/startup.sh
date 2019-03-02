/fixuser.sh jackett evil
chown -R evil:evil /usr/lib/jackett /var/lib/jackett

/fixuser.sh sickchill evil
chown -R evil:evil /opt/sickchill
if [ ! -f /opt/sickchill/data/sickbeard.db ]; then
	cp -R /opt/sickchill/data_orig/* /opt/sickchill/data/.
fi

/fixuser.sh couchpotato evil
chown -R evil:evil /var/lib/couchpotato /run/couchpotato

/base_startup.sh

su - evil -c 'screen -d -m -S sick python2 /opt/sickchill/app/SickBeard.py --quiet --nolaunch --datadir /opt/sickchill/data'

su - evil -c 'screen -d -m -S couch couchpotato --config_file /var/lib/couchpotato/config.ini --data_dir /var/lib/couchpotato --pid_file=/run/couchpotato/couchpotato.pid --console_log'

/run_jackett.sh &

while true
do
	sleep 1h
done
