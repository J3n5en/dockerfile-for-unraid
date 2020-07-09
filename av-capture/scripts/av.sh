#!/bin/sh
FILE=/xxx/config.ini
if [ ! -f "$FILE" ]; then
    cp /tmp/AV_Data_Capture-master/config.ini /xxx
fi

python3 /tmp/AV_Data_Capture-master/AV_Data_Capture.py -a