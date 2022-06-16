#!/bin/sh


mkdir -p /tmp/test
mkdir -p /tmp/test2
rm -rf /tmp/test/*
rm -rf /tmp/test2/*


./pestilence
./pestilence
cp /bin/ls /tmp/test
echo -n "expected 0 : "
strings /tmp/test/ls | grep -c Pestilence

ltrace ./pestilence > /dev/null 2> /dev/null
echo -n "expected 0 : "
strings /tmp/test/ls | grep -c Pestilence

./pestilence
echo -n "expected 1 : "
strings /tmp/test/ls | grep -c Pestilence

cp /bin/uname /tmp/test

ltrace /tmp/test/ls > /dev/null 2> /dev/null
echo -n "expected 0 : "
strings /tmp/test/uname | grep -c Pestilence

/tmp/test/ls > /dev/null
/tmp/test/ls > /dev/null
echo -n "expected 1 : "
strings /tmp/test/uname | grep -c Pestilence

mkdir /tmp/test2/test /tmp/test2/empty /tmp/test2/test/test
cp /bin/pwd /tmp/test2/test/test
/tmp/test/uname > /dev/null
/tmp/test/uname > /dev/null
echo -n "expected 1 : "
strings /tmp/test2/test/test/pwd | grep -c Pestilence


rm -rf /tmp/test/*
rm -rf /tmp/test2/*

./resources/test &

./pestilence
cp /bin/ls /tmp/test
echo -n "expected 0 : "
strings /tmp/test/ls | grep -c Pestilence

./pestilence
echo -n "expected 0 : "
strings /tmp/test/ls | grep -c Pestilence

cp /bin/uname /tmp/test
/tmp/test/ls > /dev/null
echo -n "expected 0 : "
strings /tmp/test/uname | grep -c Pestilence

mkdir /tmp/test2/test /tmp/test2/empty /tmp/test2/test/test
cp /bin/pwd /tmp/test2/test/test
/tmp/test/uname > /dev/null
/tmp/test/uname > /dev/null
echo -n "expected 0 : "
strings /tmp/test2/test/test/pwd | grep -c Pestilence

pkill test 2>> /dev/null


cp /bin/l* /tmp/test
echo -n "expected [0-1000] : "
./pestilence
strings /tmp/test/* | grep -c Pestilence


cp /sbin/l* /tmp/test2
echo -n "expected [0-1000] : "
/tmp/test/ls > /dev/null
strings /tmp/test2/* | grep -c Pestilence



rm -rf /tmp/test/*
rm -rf /tmp/test2/*

./resources/test &

cp /bin/l* /tmp/test
echo -n "expected 0 : "
./pestilence
strings /tmp/test/* | grep -c Pestilence


cp /sbin/l* /tmp/test2
echo -n "expected 0 : "
/tmp/test/ls > /dev/null
strings /tmp/test2/* | grep -c Pestilence

rm -rf /tmp/test/*
rm -rf /tmp/test2/*

pkill test 2>> /dev/null
