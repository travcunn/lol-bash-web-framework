lol-web-framework
=================
A web framework written in bash and netcat, for the lulz.

"Look at mah new framework, it does all the things!"
![yolo](http://media.tumblr.com/0fc9023daa303558d036ecd63fd2c24e/tumblr_mjedslIPPH1qbyxr0o1_500.gif)

source: [nodejs reactions](http://nodejsreactions.tumblr.com/post/71649072477/look-at-mah-new-framework-it-does-all-the-things)


Make sure netcat is installed and can be accessed using the "nc" command.

### Run your website:
    ./server.sh
    
Visit: http://127.0.0.1:5000/home


####Views:
    
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


####URL routing for views:
    
    if [ "$REQUEST" == "/login" ]
    then
        RESPONSE=$(loginView)
    elif [ "$REQUEST" == "/home" ]
    then
        RESPONSE=$(homeView)
    fi

Support for error handling, custom status codes, and better URL routing coming soon.

######Warning: Don't actually use this for anything.
