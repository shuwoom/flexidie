#!/usr/bin/env bash
#str="../../EspAppTools/androidMSigned"
#appPath="."
str=$1
appPath=$2
moduleName=$3
mv ./build/outputs/apk/${moduleName}-release.apk ./build/outputs/apk/${moduleName}-release-unsigned.apk
echo "java path : $str/signapk.jar"
java -jar ${str}/signapk.jar ${str}/platform.x509.pem ${str}/platform.pk8 ${appPath}/build/outputs/apk/${moduleName}-release-unsigned.apk ${appPath}/build/outputs/apk/${moduleName}-release-signed.apk
#remove temp apk
rm ${appPath}/build/outputs/apk/${moduleName}-release-unsigned.apk
#install apk
# Begin modified by zhuo.peng on 2017/08/15
if [ ! -z "`which adb`" ]; then
    adb=`which adb`
else
    adb="/automount/tools/adb"
fi
$adb install -r ${appPath}/build/outputs/apk/${moduleName}-release-signed.apk
# End modified by zhuo.peng on 2017/08/15
