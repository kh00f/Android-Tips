grep -RniE "getStringExtra|getBooleanExtra|getIntExtra|getLongExtra" smali* | while read -r line; do
    file=$(echo "$line" | cut -d: -f1)
    lineno=$(echo "$line" | cut -d: -f2)

    block=$(sed -n "$((lineno-8)),$((lineno+2))p" "$file")

    key=$(echo "$block" | grep "const-string" | sed -E 's/.*const-string [vp0-9, ]+"([^"]+)".*/\1/' | head -1)

    if echo "$line" | grep -q "getStringExtra"; then type="string"; fi
    if echo "$line" | grep -q "getBooleanExtra"; then type="boolean"; fi
    if echo "$line" | grep -q "getIntExtra"; then type="int"; fi
    if echo "$line" | grep -q "getLongExtra"; then type="long"; fi

    if [ ! -z "$key" ] && [ ! -z "$type" ]; then
        echo "extra: $key | type: $type | path: $file"
    fi
done
