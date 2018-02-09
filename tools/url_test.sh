response="$(curl -v "$1" --max-time 10 2>&1)"

_fin="$?"
if [[ "$_fin" -ne 0 && -z "$(echo $response | grep 'HTTP/')" ]] ; then
    echo '==============================================='
    echo $_fin $1
    echo '==============================================='
    echo "$response"
    echo '==============================================='
    echo
    echo
fi
