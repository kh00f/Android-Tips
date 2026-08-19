============================================
                  Command 1
============================================


find . \( -name "BuildConfig.java" -o -name "BuildConfig.smali" \)



============================================
                  Command 2
============================================

find . \( -name "BuildConfig.java" -o -name "BuildConfig.smali" \) \
-exec sh -c '
for f; do
    echo "========== $f =========="
    cat "$f"
    echo
done
' sh {} +
