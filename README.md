lol-bash-web-framework
=================
A web framework written in bash.

"Look at mah new framework, it does all the things!"
![yolo](http://media.tumblr.com/0fc9023daa303558d036ecd63fd2c24e/tumblr_mjedslIPPH1qbyxr0o1_500.gif)

<sub>source: [nodejs reactions](http://nodejsreactions.tumblr.com/post/71649072477/look-at-mah-new-framework-it-does-all-the-things)</sub>


###Requirementz
Make sure netcat is installed.

###Start the internetz:
    ./server.sh
    
Visit: http://127.0.0.1:5000/home


####views.sh:
    
```bash
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

: '
# Implement a custom 404 view.
function 404View()
{
    echo "<h1>404 Not Found</h1>"
}
'
```

####urls.sh:
    
```bash
# URLs for routing to views
URLS=( ["/home"]=homeView )
```

####Host configuration:
The default port is 5000, but can be changed in config.sh by editing the "PORT" variable:

```bash
PORT=5000
```

Work in progress... Feel free to add additional functionality. Ideas: custom status codes for views, SSL, regex URL routing, templating....

######Warning: Don't actually use this for anything.
