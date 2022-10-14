#!/bin/bash

apt update
apt install rsync -y

cd /root/crdroid

. build/envsetup.sh
lunch lineage_m10lte-eng

mka bootimage
mka vendorimage
mka recoveryimage
