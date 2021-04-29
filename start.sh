#!/bin/bash

x=1
while [ $x -le 5 ]; do
    curl "$TOKEN" > out.json
    line=$(cat out.json | jq -r '.entries | ."'$CHART'" | .[] | .version' | grep $VERSION)
    if [ "$line" == "" ]; then
        echo "Charts no found yet."
        x=$(( $x + 1 ))
        sleep 25
    else
        echo "Found."
        break
    fi
done