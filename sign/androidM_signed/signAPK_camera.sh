#!/usr/bin/env bash
#str="../../EspAppTools/androidMSigned"
#appPath="."
#TctCamera_M_Global_v0.4.3.1.0002.0_signed_platform_alldpi.apk
str=$1
appPath=$2
moduleName=$3
versionName=`cat ./src/main/AndroidManifest.xml | grep "versionName" | sed -e 's/.*="//' -e 's/">.*//'`
echo "versionName : $versionName"
mv ./build/outputs/apk/${moduleName}-release-unsigned.apk ./build/outputs/apk/${moduleName}-release_unsign.apk
echo "java path : $str/signapk.jar"
java -jar ${str}/signapk.jar ${str}/platform.x509.pem ${str}/platform.pk8 ${appPath}/build/outputs/apk/${moduleName}-release_unsign.apk ${appPath}/build/outputs/apk/TctCamera_M_Global_${versionName}_signed_platform_alldpi.apk
#remove temp apk
rm ${appPath}/build/outputs/apk/${moduleName}-release_unsign.apk
#cp ./build/outputs/apk/${moduleName}-release-unsigned.apk ./build/outputs/apk/TctCamera_M_Global_${versionName}_signed_platform_alldpi.apk
#install apk
/automount/tools/adb install -r ${appPath}/build/outputs/apk/TctCamera_M_Global_${versionName}_signed_platform_alldpi.apk
