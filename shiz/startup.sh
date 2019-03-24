/runuser.sh evil 'mkdir /config/{jackett,radarr,sonarr,mylar,pymedusa,sickchill,watcher}'
if [ ! -f /var/lib/jackett/ServerConfig.json ]; then
	cp /home/evil/shiz/ServerConfig.json /var/lib/jackett/.
fi
/fixuser.sh jackett evil
chown -R evil:evil /usr/lib/jackett

if [ ! -f /opt/sickchill/data/config.ini ]; then
	cp /home/evil/shiz/sconfig.ini /opt/sickchill/data/config.ini
fi
/fixuser.sh sickchill evil

if [ ! -f /var/lib/radarr/config.xml ]; then
	cp /home/evil/shiz/rconfig.xml /var/lib/radarr/config.xml
fi
/fixuser.sh radarr evil
chown -R evil:evil /usr/lib/radarr

if [ ! -f /var/lib/sonrr/config.xml ]; then
	cp /home/evil/shiz/sconfig.xml /var/lib/sonarr/config.xml
fi
/fixuser.sh sonarr evil

if [ ! -f /var/lib/mylar/config.ini ]; then
	cp /home/evil/shiz/mconfig.ini /var/lib/mylar/config.ini
fi
/fixuser.sh mylar evil

if [ ! -f /var/lib/pymedusa/config.ini ]; then
	cp /home/evil/shiz/pconfig.ini /var/lib/pymedusa/config.ini
fi
/fixuser.sh pymedusa evil

if [ ! -f /opt/watcher3/userdata/config.cfg ]; then
	cp /home/evil/shiz/config.cfg /opt/watcher3/userdata/config.cfg
fi
/fixuser.sh watcher evil

if [ ! -f /config/nzbget.conf ]; then
	cp /home/evil/shiz/nzbget.conf /config
fi

chown -R evil:evil /config
chown evil:evil /downloads

/base_startup.sh

if [ ! -z $RUN_JACKETT ] || [ ! -z $RUN_ALL ]; then
	/run_jackett.sh &
fi

if [ ! -z $RUN_SICKCHILL ] || [ ! -z $RUN_ALL ]; then
	/run_sickchill.sh &
fi

if [ ! -z $RUN_RADARR ] || [ ! -z $RUN_ALL ]; then
	/run_radarr.sh &
fi

if [ ! -z $RUN_SONARR ] || [ ! -z $RUN_ALL ]; then
	/run_sonarr.sh &
fi

if [ ! -z $RUN_MYLAR ] || [ ! -z $RUN_ALL ]; then
	/run_mylar.sh &
fi

if [ ! -z $RUN_PYMEDUSA ] || [ ! -z $RUN_ALL ]; then
	/run_pymedusa.sh &
fi

if [ ! -z $RUN_NZBGET ] || [ ! -z $RUN_ALL ]; then
	/run_nzbget.sh &
fi

if [ ! -z $RUN_WATCHER ] || [ ! -z $RUN_ALL ]; then
	/run_watcher.sh &
fi

while true
do
	sleep 1h
done
