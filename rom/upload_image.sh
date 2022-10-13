#!/bin/bash

cd /root/crdroid/out/target/product/m10lte
mkdir /root/image

cp -r * /root/image

cd /root/image

rm -rf obj obj_arm

tar -cf image.tar *

export OUTPUT="image.tar" && FILENAME=$(echo $OUTPUT) && curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK

cd /root/crdroid
