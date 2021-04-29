#!/bin/bash


while true; do
    curl "$SITE" -H "Accept: application/json" -H "Authorization: Bearer $TOKEN" > out.json
    line=$(cat out.json | jq -r '.entries | ."'$CHART'" | .[] | .version' | grep $VERSION)
    if [ "$line" == "" ]; then
        echo "Charts no found yet."
        sleep 5
    else
        echo "Found."
        break
    fi
done