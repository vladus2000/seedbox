if [ ! -f /var/lib/jackett/ServerConfig.json ]; then
	cp /home/evil/shiz/ServerConfig.json /var/lib/jackett/.
fi
/fixuser.sh jackett evil
chown -R evil:evil /usr/lib/jackett /var/lib/jackett

if [ ! -f /opt/sickchill/data/config.ini ]; then
	cp /home/evil/shiz/sconfig.ini /opt/sickchill/data/config.ini
fi
/fixuser.sh sickchill evil
chown -R evil:evil /opt/sickchill

if [ ! -f /var/lib/couchpotato/config.ini ]; then
	cp /home/evil/shiz/cconfig.ini /var/lib/couchpotato/config.ini
fi
/fixuser.sh couchpotato evil
chown -R evil:evil /var/lib/couchpotato /run/couchpotato

if [ ! -f /var/lib/radarr/config.xml ]; then
	cp /home/evil/shiz/rconfig.xml /var/lib/radarr/config.xml
fi
/fixuser.sh radarr evil
chown -R evil:evil /var/lib/radarr

if [ ! -f /var/lib/sonrr/config.xml ]; then
	cp /home/evil/shiz/sconfig.xml /var/lib/sonrr/config.xml
fi
/fixuser.sh sonarr evil
chown -R evil:evil /var/lib/sonarr

/base_startup.sh

if [ ! -z $RUN_COUCHPOTATO ]; then
	su - evil -c 'screen -d -m -S couch couchpotato --config_file /var/lib/couchpotato/config.ini --data_dir /var/lib/couchpotato --pid_file=/run/couchpotato/couchpotato.pid --console_log'
fi

if [ ! -z $RUN_JACKETT ]; then
	/run_jackett.sh &
fi

if [ ! -z $RUN_SICKCHILL ]; then
	/run_sickchill.sh &
fi

if [ ! -z $RUN_RADARR ]; then
	/run_radarr.sh &
fi

if [ ! -z $RUN_SONARR ]; then
	/run_sonarr.sh &
fi

while true
do
	sleep 1h
done
