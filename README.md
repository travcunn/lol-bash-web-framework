lol-web-framework
=================
A web framework written in bash, for the lulz.

"Look at mah new framework, it does all the things!"
![yolo](http://media.tumblr.com/0fc9023daa303558d036ecd63fd2c24e/tumblr_mjedslIPPH1qbyxr0o1_500.gif)

<sub>source: [nodejs reactions](http://nodejsreactions.tumblr.com/post/71649072477/look-at-mah-new-framework-it-does-all-the-things)</sub>


Make sure netcat is installed and can be accessed using the "nc" command.

### Start the internetz:
    ./server.sh
    
Visit: http://127.0.0.1:5000/home


####Viewz:
    
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
```

####URLz:
    
```bash
if [ "$REQUEST" == "/login" ]
then
    RESPONSE=$(loginView)
elif [ "$REQUEST" == "/home" ]
then
    RESPONSE=$(homeView)
fi
```

####Host configuration:
The default port is 5000, but can be changed in server.sh by editing the "PORT" variable:

```bash
PORT=5000
```

Support for error handling, custom status codes, and better URL routing coming soon.

######Warning: Don't actually use this for anything.
