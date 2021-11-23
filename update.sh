#!/bin/bash
cd /root/NostalgiaForInfinity

GITRESPONSE=`git pull`
UPDATED='Already up to date.'

if [[ $GITRESPONSE != $UPDATED ]]; then
        cp NostalgiaForInfinityX.py /root/NostalgiaForInfinity/user_data/strategies/NostalgiaForInfinityX.py
                GITMESSAGE=`git log HEAD@{1}.. --pretty=%B`
        cd /root/NostalgiaForInfinity
        docker-compose down
        docker-compose up --force-recreate --build -d

        if [[ $GITMESSAGE != "" ]]; then
                python3 /root/NostalgiaForInfinity/notify.py "$GITMESSAGE"
                python3 /root/NostalgiaForInfinity/notify_vol.py "$GITMESSAGE"
        else
                python3 /root/NostalgiaForInfinity/notify.py
                python3 /root/NostalgiaForInfinity/notify_vol.py
        fi

fi
