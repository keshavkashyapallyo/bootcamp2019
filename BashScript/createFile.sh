#!/bin/bash/


file1="/tmp/file1.txt"
file2="/tmp/file2.txt"

echo "Adding first line" > $file1
echo "Adding first line replaced" > $file1
echo "Appending second line " >> $file1
echo "Appending third line" >> $file1
cat $file1

tr [A-Z] [a-z] < $file1 > $file2

echo "*****************OUTPUT********************"

cat $file2
