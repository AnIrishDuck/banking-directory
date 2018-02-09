cat directory.json \
    | jq '.data | map(.url)' \
    | python tools/arr.py \
    | xargs -n 1 python tools/domain.py \
    | sort | uniq \
    | xargs -n 1 -P 32 bash tools/ev.sh
