#!/bin/bash

PARSER="./incompleted/incompleted/parser"
TEST_DIR="./test/test"

ALL_PASS=true

echo "====================="
echo " Running KPL Tests "
echo "====================="

for i in 1 2 3 4
do
    INPUT="$TEST_DIR/example$i.kpl"
    EXPECT="$TEST_DIR/result$i.txt"
    OUTPUT="out$i.txt"

    echo -n "Test $i: "

    # chạy parser
    $PARSER $INPUT > $OUTPUT

    # diff kết quả
    if diff -q "$OUTPUT" "$EXPECT" > /dev/null; then
        echo "PASS"
    else
        echo "FAIL"
        ALL_PASS=false

        echo "------ DIFF (Test $i) ------"
        diff -y --suppress-common-lines "$OUTPUT" "$EXPECT"
        echo ""

        echo "------ EXPECTED ------"
        cat "$EXPECT"
        echo ""

        echo "------ ACTUAL ------"
        cat "$OUTPUT"
        echo "----------------------"
    fi
done

echo "====================="
if $ALL_PASS; then
    echo "FINAL RESULT: TRUE (All tests pass)"
else
    echo "FINAL RESULT: FALSE (Some tests failed)"
fi
echo "====================="
