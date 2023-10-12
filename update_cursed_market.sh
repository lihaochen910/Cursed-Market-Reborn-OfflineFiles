#!/bin/bash

cd ~/GitWorkspace/Cursed-Market-Reborn-OfflineFiles
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
