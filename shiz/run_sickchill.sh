while true
do
	su - evil -c 'python2 /opt/sickchill/app/SickBeard.py --quiet --nolaunch --datadir /opt/sickchill/data'
	sleep 1
done
