#!/bin/bash

mkdir /root/image

cp out/target/product/m10lte/boot.img /root/image
cp out/target/product/m10lte/recovery.img /root/image
cp out/target/product/m10lte/vendor.img /root/image

cd /root/image

zip image.zip *

export OUTPUT="image.zip" && FILENAME=$(echo $OUTPUT) && curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK

cd /rom/crdroid
