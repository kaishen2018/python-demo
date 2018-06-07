#! /bin/bash

echo "file name: $0"
echo "1 parameter name: $1"
echo "2 parameter name: $2"

fileCount=$1
timeInterval=$2

# 打印数据
fileName="mini-push-2-20180601-part"
extName=".csv"

echo "fileName: $fileName"
echo "extName: $extName"

declare -a files

# TODO
# 组合所需文件列表
for((i=1;i<=68;i++));
do
   temp=$fileName$i$extName
   files=(${files[@]} $temp)
done

# TODO
# 遍历所有文件，执行发送任务
for file in ${files[@]};
do
 echo "$file"
done

echo " total Length =  ${#files[@]}"

printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

myFunc() {
  echo "my first function"

}

myFunc


exit 0