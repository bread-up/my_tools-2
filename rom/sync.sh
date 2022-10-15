#!/bin/bash

# install package..
apt update -y
apt install sudo git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc libncurses5 unzip python-is-python3 -y
# run repo..

mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
ln -sf ~/bin/repo /usr/bin/repo

curl -L -o h.deb http://mirrors.kernel.org/ubuntu/pool/main/b/bc/bc_1.07.1-2_amd64.deb
dpkg -i h.deb

curl -L -o l.deb http://mirrors.kernel.org/ubuntu/pool/main/p/popt/libpopt0_1.16-11_amd64.deb
dpkg -i l.deb

curl -L -o i.deb http://security.ubuntu.com/ubuntu/pool/main/r/rsync/rsync_3.1.2-2.1ubuntu1.5_amd64.deb
dpkg -i i.deb

# set configs.
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Create dirs
cd /root
mkdir crdroid ; cd crdroid

# Init repo
repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-17.1

# Clone my local repo
git clone https://github.com/AndVer2/android_manifest_samsung_m10lte.git -b lineage-17.1 .repo/local_manifests

# Sync
repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
. build/envsetup.sh
lunch lineage_m10lte-eng

mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka bacon -j`nproc`
cd out/target/product/m10lte
export OUTPUT="*m10lte*.zip" && FILENAME=$(echo $OUTPUT) && curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK

