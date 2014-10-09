PORT=5000

function homeView()
{
    local view=$(cat views/index.html)
    echo "$view"
}

function loginView()
{
    local view=$(cat views/login.html)
    echo "$view"
}

function setup()
{
    rm -f out
    mkfifo out
    trap "rm -f out" EXIT
}

function runServer()
{
    setup
    while true
    do
    cat out | nc -l $PORT > >(
        export REQUEST=
        while read line
        do
        line=$(echo "$line" | tr -d '[\r\n]')
        if echo "$line" | grep -qE '^GET /'
        then
            REQUEST=$(echo "$line" | cut -d ' ' -f2)
        elif [ "x$line" = x ]
        then
            if [ "$REQUEST" == "/login" ]
            then
                RESPONSE=$(loginView)
            elif [ "$REQUEST" == "/home" ]
            then
                RESPONSE=$(homeView)
            fi
            echo -en "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ${#RESPONSE}\n\n$RESPONSE" > out
        fi
        done
    )
    done
}

runServer
