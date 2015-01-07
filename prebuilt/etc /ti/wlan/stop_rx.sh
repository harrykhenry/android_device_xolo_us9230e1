#!/system/bin/sh
echo "stop rx"
calibrator wlan0 plt stop_rx_statcs
sleep 1
echo "power off"
calibrator wlan0 plt power_mode off
