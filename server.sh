#!/usr/bin/env bash

source config.sh
source views.sh

declare -A URLS
source urls.sh

${URLS["/home"]}

function setup()
{
    rm -f /tmp/out
    mkfifo /tmp/out
    trap "rm -f /tmp/out" EXIT
}

# Return a view
function routeURL(){
    request=$1

    for K in "${!URLS[@]}";
    do
        if [ "$REQUEST" == "$K" ]
        then
            local viewname="${URLS["${!URLS[@]}"]}"
            local view=$("$viewname")
        fi
    done

    echo "$view"
}

function runServer()
{
    setup
    while true
    do
    cat /tmp/out | nc -l $PORT > >(
        export REQUEST=
        while read line
        do
        line=$(echo "$line" | tr -d '[\r\n]')
        if echo "$line" | grep -qE '^GET /'
        then
            REQUEST=$(echo "$line" | cut -d ' ' -f2)
        elif [ "x$line" = x ]
        then
            RESPONSE=$(routeURL REQUEST)
            echo -en "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ${#RESPONSE}\n\n$RESPONSE" > /tmp/out
        fi
        done
    )
    done
}

runServer
