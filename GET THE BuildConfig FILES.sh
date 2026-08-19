find . \( -name "BuildConfig.java" -o -name "BuildConfig.smali" \)

------------------------------------

find . \( -name "BuildConfig.java" -o -name "BuildConfig.smali" \) \
-exec sh -c '
for f; do
    echo "========== $f =========="
    cat "$f"
    echo
done
' sh {} +
