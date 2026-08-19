============================================
                  Command 1
============================================

 find . \( \
-name "*.properties" -o \
-name "*.json" -o \
-name "*.conf" -o \
-name "*.cfg" -o \
-name "*.ini" -o \
-name "*.txt" -o \
-name "*.js"  \
\)




============================================
                  Command 2
============================================



find . \( \
-name "*.properties" -o \
-name "*.json" -o \
-name "*.conf" -o \
-name "*.cfg" -o \
-name "*.ini" -o \
-name "*.txt" -o \
-name "*.js"  \
\) -exec sh -c '
for f; do
    echo "=================================================================="
    echo "FILE: $f"
    echo "=================================================================="
    cat "$f"
    echo
done
' sh {} +
