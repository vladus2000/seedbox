cd /home/evil/downloads
mkdir atr
cd atr
ln -s /config/atr/config.txt config.txt
cat /config/atr/config - | python /home/evil/atr/main.py
