#!/bin/bash

apt update
apt install rsync -y

cd /root/crdroid

mka bootimage -j`nproc`
mka vendorimage -j`nproc`
mka recoveryimage -j`nproc`
