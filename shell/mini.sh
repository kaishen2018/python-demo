#!/bin/bash



for((i=1;i<=10;i++));
do
echo $(expr $i \* 3 + 1);

atime=`date -d "$1" +%s`

btime=`date -d "$2" +%s`

done
