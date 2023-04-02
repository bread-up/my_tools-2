#!/bin/bash

# install package
apt update -y
apt install locales sudo git-core tmate gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc libncurses5 unzip python3 -y

# run repo
mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
ln -sf ~/bin/repo /usr/bin/repo

# set configs.
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Create dirs
cd /root
mkdir crdroid ; cd crdroid

# Init repo
repo init --depth=1 -u https://github.com/bread-up/android -b 8.1

# Clone my local repo
git clone https://github.com/youssefnone/android_manifest_samsung_m10lte.git -b crdroid-10 .repo/local_manifests

# Sync
repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
. build/envsetup.sh
lunch lineage_m10lte-user
mka bacon -j$(nproc --all)

cd out/target/product/m10lte
export OUTPUT="*m10lte*zip" && FILENAME=$(echo $OUTPUT) && curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK
