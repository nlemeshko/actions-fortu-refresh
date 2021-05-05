#!/bin/bash

x=1
y=0
CHART=($CHART)

while [ $x -le 5 ]; do
    if [ -z "${CHART[$y]}" ]
    then
        break
    else
        curl "$TOKEN" > out.json
        line=$(cat out.json | jq -r '.entries | ."'${CHART[$y]}'" | .[] | .version' | grep $VERSION)
        if [ "$line" == "" ]; then
            echo "Charts no found yet."
            x=$(( $x + 1 ))
            sleep 25
        else
            echo "Found."
            x=1
            y=$(( $y + 1 ))
        fi
    fi
done
