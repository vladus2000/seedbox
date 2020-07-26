cd /home/evil/downloads
mkdir atr
cd atr
ln -s /config/atr/config.txt config.txt
{ cat /config/atr/config; tail -f /dev/null; } | python /home/evil/atr/main.py
