#!/bin/sh

WAN_INTERFACE=eth0

loop=1

while [ $loop -eq 1 ]
      do
           # check for interface
           ret=`ifconfig | grep $WAN_INTERFACE | grep -v $WAN_INTERFACE:0`
           if [ "$ret" ]; then
                # check for IP address
	   ipAddress=`ifconfig $WAN_INTERFACE |  grep inet | grep -v localhost | grep -v 127.0.0.1 |tr -s ' ' | cut -d ' ' -f3 | sed -e 's/addr://g'`
                if [ "$ipAddress" ]; then
                       echo "ipAddress: $ipAddress"
                       loop=0
                else
                       sleep 5
                fi
           else
                sleep 5
           fi
      done
echo --------- $interface got an ip $ipAddress starting dropbear service ---------
dropbear -b /etc/sshbanner.txt -a -p $ipAddress:22 &

