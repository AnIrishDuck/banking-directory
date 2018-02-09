sub="$(echo $1 | sed -e 's/[^\.]*\.//')"
subsub="$(echo $sub | sed -e 's/[^\.]*\.//')"

resolve() {
    url="$(timeout 5 curl -Ls -o /dev/null -w '%{url_effective}' https://$1)"
    if [[ -z "$url" ]] ; then
        url="$(timeout 5 curl -Ls -o /dev/null -w '%{url_effective}' http://$1)"
    fi
    if [[ -n "$url" ]] ; then
        python tools/domain.py $url
    fi
}

a="$(resolve $1)"
b="$(resolve $sub)"
c="$(resolve $subsub)"

echo -n "$1 => $a $b $c"
deets="$(
    (timeout 5 bash tools/tls.sh $a) 2>/dev/null | grep businessCategory
    (timeout 5 bash tools/tls.sh $b) 2>/dev/null | grep businessCategory
    (timeout 5 bash tools/tls.sh $c) 2>/dev/null | grep businessCategory
)"

if [[ -n "$deets" ]] ; then
    echo " => FOUND ./domain/ev/$1"
    echo "$deets" > ./domain/ev/$1
else
    echo " => NADA"
fi
