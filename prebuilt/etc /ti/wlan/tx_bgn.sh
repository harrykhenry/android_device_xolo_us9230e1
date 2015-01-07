#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <mode > <channel> <rate> <Tx power>" 
echo "# Example: test mode g TX with channel 1, 54Mbps, 15dbm"
echo "# sh $0 4 1 4096 15000"
echo "#Modes:"
echo "#b: 0 g: 4 n: 6"
echo "#Rates:"
echo "#1M: 1    2M:2    5.5M:4     6M: 8      9M: 16   11M:32 12M:64 "
echo "#18M:128 24M:512  36M: 1024  48M:2048   54M:4096 "
echo "#*************************************************"

echo "power on"
calibrator wlan0 plt power_mode on
sleep 1
echo "set channel $2"
calibrator wlan0 plt tune_channel 0 $2
echo "start tx"
sleep 1
calibrator wlan0 plt tx_cont 20 $3 1000 0 $4 10000 3 1 0 $1 0 1 1 1 DE:AD:BE:EF:00:00


