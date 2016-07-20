#!/bin/sh
. /etc/device.properties

if [ "$DEVICE_TYPE" = "hybrid" ];then

    if [ "$PODNET_INTERFACE" != "" ]; then
        interface=`ls /sys/class/net | grep $PODNET_INTERFACE`
        if [ "$interface" != "" ]; then
            #Bringing down podnet0 interface
            ifconfig $PODNET_INTERFACE down
        fi
    fi
fi

if [ "$ETHERNET_INTERFACE" != "" ]; then
    interface=`ls /sys/class/net | grep $ETHERNET_INTERFACE`
    if [ "$interface" != "" ] && [ "$BUILD_TYPE" = "prod" ]; then   
        #bringing down eth0 interface for production images
        ifconfig $ETHERNET_INTERFACE down
    fi
fi


