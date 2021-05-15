#!/bin/sh

#Cosmote Remaining Data Domoticz Updater
#Yiannis Siakavelis 2019

ScriptVersion='2.0'
DomoticzHost='x.x.x.x' #Change that to your Domoticz IP
DomoticzPort='8080' #Change that to your Domoticz Port
IDX='16'

#2021-05-15 Reduced one line from awk
#MB_LEFT=`lynx -dump -nolist "http://ciotgprepaid.cosmote.gr/iotg/iotg.portal?_nfpb=true&_pageLabel=RemainderPage&iotgRemainder_right_actionOverride=%2FFlows%2FRemainder%2Fbegin&_windowLabel=iotgRemainder_right&loc=en_US" | grep "Remaining Volume:*" | sed 's/ /\n/g' | awk 'NR==7'| sed 's/MB/\n/g' | awk 'NR==1'`

MB_LEFT=`lynx -dump -nolist "http://ciotgprepaid.cosmote.gr/iotg/iotg.portal?_nfpb=true&_pageLabel=RemainderPage&iotgRemainder_right_actionOverride=%2FFlows%2FRemainder%2Fbegin&_windowLabel=iotgRemainder_right&loc=en_US" | grep "Remaining Volume:*" | sed 's/ /\n/g' | awk 'NR==6'| sed 's/MB/\n/g' | awk 'NR==1'`


echo "Cosmote Remaining Data Domoticz Updater v$ScriptVersion"
echo "Host:$DomoticzHost"
echo "MB Left:$MB_LEFT"
echo "curl -s http://$DomoticzHost:$DomoticzPort/json.htm?type=command&param=udevice&idx=$IDX&nvalue=0&svalue=$MB_LEFT"
curl -s "$DomoticzHost:$DomoticzPort/json.htm?type=command&param=udevice&idx=$IDX&nvalue=0&svalue=$MB_LEFT"


