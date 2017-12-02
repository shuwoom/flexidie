#!/usr/bin/env bash
#str="../../EspAppTools/androidMSigned"
#appPath="."
str="../EspAppTools/androidM_signed"
ant clean && ant treleasesigned
java -jar ${str}/signapk.jar ${str}/platform.x509.pem ${str}/platform.pk8 ./bin/JrdGallery_release_unsigned_platform.apk ./bin/JrdGallery_release_signed_platform.apk

#install apk
/automount/tools/adb install -r ./bin/JrdGallery_release_signed_platform.apk
