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
	cp /home/evil/shiz/sconfig.xml /var/lib/sonarr/config.xml
fi
/fixuser.sh sonarr evil
chown -R evil:evil /var/lib/sonarr

if [ ! -f /var/lib/mylar/config.ini ]; then
	cp /home/evil/shiz/mconfig.ini /var/lib/mylar/config.ini
fi
/fixuser.sh mylar evil
chown -R evil:evil /var/lib/mylar

if [ ! -f /var/lib/pymedusa/config.ini ]; then
	cp /home/evil/shiz/pconfig.ini /var/lib/pymedusa/config.ini
fi
/fixuser.sh pymedusa evil
chown -R evil:evil /var/lib/pymedusa

/base_startup.sh

if [ ! -z $RUN_COUCHPOTATO ]; then
	/run_couchpotato.sh &
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

if [ ! -z $RUN_MYLAR ]; then
	/run_mylar.sh &
fi

if [ ! -z $RUN_PYMEDUSA ]; then
	/run_pymedusa.sh &
fi

while true
do
	sleep 1h
done
