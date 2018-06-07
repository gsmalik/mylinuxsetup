sudo rm -rf /var/run/wpa_supplicant/wlx00e04c13211e
sudo wpa_supplicant -i wlx00e04c13211e -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf &
sleep 20
sudo dhclient
