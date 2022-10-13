#!/bin/bash

cd /root/crdroid/out/target/product/m10lte
mkdir /root/image

cp -r * /root/image

cd /root/image

rm -rf obj obj_arm

tar -cf image.tar *

export OUTPUT="image.tar" && FILENAME=$(echo $OUTPUT) && curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK

rm -rf *

cd /root/crdroid/out/target/product/m10lte

cp -r obj /root/image
cp -r obj_arm /root/image

cd /root/image

tar -cf image1.tar *

export OUTPUT="image1.tar" && FILENAME1=$(echo $OUTPUT1) && curl -T $FILENAME1 https://oshi.at/${FILENAME1}/${OUTPUT1} > mirror1.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK1=$(cat mirror1.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK1

cd /root/crdroid
