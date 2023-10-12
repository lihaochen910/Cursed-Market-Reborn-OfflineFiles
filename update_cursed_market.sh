#!/bin/bash

cd ~/GitWorkspace/Cursed-Market-Reborn-OfflineFiles

# hearbeat test
url_heartbeat='https://cursed.cranchpalace.info/DaylightGame/heartBeat'

hearbeat_response="$(curl -X GET $url_heartbeat)"
if [[ "$hearbeat_response" == 'OK' ]]; then
	echo 'HeartBeat ok.'
else
	echo 'HeartBeat failed.'
	echo 'Service Return:'$hearbeat_response
	echo 'check' $url_heartbeat
	exit -1
fi

curl -O "https://cursed.cranchpalace.info/DaylightGame/files/{market,marketDlc,dbdCharacterData,singleDbdCharacterData,dbdItemsList,catalog,killSwitch}.json"

current_time="$(date '+%Y-%m-%d %H:%M:%S')"
echo $current_time

if [ -n "$(git status -s)" ]; then
	# 有变动 上传
	echo " detect file changed."

	git add --all
	git commit -m "$current_time"
	git push origin main

else
	echo "no change, pass."
fi
