sub="$(echo $1 | sed -e 's/[^\.]*\.//')"

resolve() {
    url="$(timeout 10 curl -Ls -o /dev/null -w '%{url_effective}' https://$1)"
    if [[ -z "$url" ]] ; then
        url="$(timeout 10 curl -Ls -o /dev/null -w '%{url_effective}' http://$1)"
    fi
    if [[ -n "$url" ]] ; then
        python tools/domain.py $url
    fi
}

a="$(resolve $1)"
b="$(resolve $sub)"
c="www.$b"

domains="$a $b $c"
deets="$(echo $domains | xargs -n 1 -P 10 timeout 5 bash tools/tls.sh 2>/dev/null | grep businessCategory)"

if [[ -n "$deets" ]] ; then
    echo -n "$1 => $domains"
    echo " => FOUND ./domain/ev/$1"
    echo "$deets" > ./domain/ev/$1
else
    echo -n "$1 => $domains"
    echo " => NADA"
fi
