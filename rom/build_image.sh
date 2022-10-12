#!/bin/bash

apt update
apt install rsync -y

cd /root/crdroid
. build/envsetup.sh
lunch lineage_m10lte-eng

mka bootimage -j`nproc`
mka vendorimage -j`nproc`
mka recoveryimage -j`nproc`
