while true
do
	su - evil -c '/usr/bin/sonarr -nobrowser -data=/var/lib/sonarr'
	sleep 1
done
