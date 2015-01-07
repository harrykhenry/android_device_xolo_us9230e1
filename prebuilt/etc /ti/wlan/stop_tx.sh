#!/system/bin/sh
echo "stop tx"
calibrator wlan0 plt tx_stop
sleep 1
echo "power off"
calibrator wlan0 plt power_mode off
