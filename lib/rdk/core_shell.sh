#!/bin/sh

. /etc/device.properties

if [ ! -d $CORE_PATH ]; then     
     mkdir -p $CORE_PATH
fi

echo "$1 crash and uploading the cores" >> $LOG_PATH/core_log.txt

echo "Dump Created" >> $LOG_PATH/core_log.txt
gzip -f > /mnt/memory/corefiles/$3_core.prog_$1.signal_$2.gz
touch /tmp/.core_dump

       

