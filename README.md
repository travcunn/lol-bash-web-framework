lol-web-framework
=================

A web framework written in bash and netcat, for the lulz. Warning: Don't actually use this for anything.

Make sure netcat is installed and can be accessed using the "nc" command.

### Run your website:
    ./server.sh
    

Visit: http://127.0.0.1:5000/home

![alt text](http://boozeblogger.com/wordpress/wp-content/uploads/2014/04/Your+Mind+Blown.+Tim+and+Eric+Awesome+Show_d781d1_3744116.gif)


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
