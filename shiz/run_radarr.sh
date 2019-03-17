while true
do
	su - evil -c '/usr/bin/mono --debug /usr/lib/radarr/Radarr.exe -nobrowser -data=/var/lib/radarr'
	sleep 1
done
