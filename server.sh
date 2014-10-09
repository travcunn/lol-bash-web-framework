#!/usr/bin/env bash

source config.sh
source views.sh

declare -A URLS
source urls.sh


function setup()
{
    rm -f /tmp/out
    mkfifo /tmp/out
    trap "rm -f /tmp/out" EXIT
}

# Default 404 view if not present in the views
function Default404View()
{
    echo "<h1>404 Not Found</h1>"
}

# Check if URL route exists
function routeExists() {
    declare -f -F $1 > /dev/null
    return $?
}

# Return a view
function routeURL(){
    request=$1

    for URL in "${!URLS[@]}";
    do
        if [ "$REQUEST" == "$URL" ]
        then
            local viewname="${URLS["${!URLS[@]}"]}"
        else
            if routeExists "404View"
            then
                local viewname="404View"
            else
                local viewname="Default404View"
            fi
        fi
        local view=$("$viewname")
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
