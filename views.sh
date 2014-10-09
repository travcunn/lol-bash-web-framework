#Views

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
