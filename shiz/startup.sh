/fixuser.sh jackett evil
chown -R evil:evil /usr/lib/jackett /var/lib/jackett

/fixuser.sh sickchill evil
chown -R evil:evil /opt/sickchill

/fixuser.sh couchpotato evil
chown -R evil:evil /var/lib/couchpotato /run/couchpotato

/base_startup.sh

su - evil -c 'screen -d -m -S couch couchpotato --config_file /var/lib/couchpotato/config.ini --data_dir /var/lib/couchpotato --pid_file=/run/couchpotato/couchpotato.pid --console_log'

/run_jackett.sh &

/run_sickchill.sh &

while true
do
	sleep 1h
done
