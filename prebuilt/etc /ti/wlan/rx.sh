#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <0: b\ g\ n 1: a> <channel>" 
echo "# Example: test b\ g\ n RX with channel 11"
echo "# sh $0 0 11"
echo "#*************************************************"


echo "power up"
calibrator wlan0 plt power_mode on
sleep 1
echo "set channel $2"
calibrator wlan0 plt tune_channel $1 $2
sleep 1
echo "start rx"
calibrator wlan0 plt start_rx_statcs
sleep 1
echo "clear couters"
calibrator wlan0 plt reset_rx_statcs
echo "Script end."
