#cd /root/crdroid
#. build/envsetup.sh
#lunch lineage_m10lte-eng
#mka bacon -j`nproc`

#cd out/target/product/m10lte
#export OUTPUT1="*m10lte*.zip" && FILENAME1=$(echo $OUTPUT1) && curl -T $FILENAME1 https://oshi.at/${FILENAME1}/${OUTPUT1} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; } && MIRROR_LINK1=$(cat mirror.txt | grep Download | cut -d\  -f1) && echo $MIRROR_LINK1
