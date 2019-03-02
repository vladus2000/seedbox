while true
do
	su - evil -c '/usr/bin/mono /usr/lib/jackett/JackettConsole.exe --DataFolder /var/lib/jackett'
	sleep 1
done
