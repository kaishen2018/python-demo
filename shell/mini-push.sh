#! /bin/bash

#url=$1
#appid=$2
#appsecret=""

# 打印数据
#fileName="mini-push-2-20180601-part"
fileName="mini-push-template"
extName=".csv"

echo "fileName: $fileName"
echo "extName: $extName"

declare -a files

# TODO
# 组合所需文件列表
for((i=1;i<=2;i++));
do
   temp=$fileName$i$extName
   files=(${files[@]} $temp)
done

# 调用NC API
callNotify() {
  dateStr=`date '+%Y%m%d-%H%M%S' `
  printf " ======> begin to call NC  at $dateStr ============> \n"


  #TODO need setup env.
  ncUrl='http://172.17.0.110:3001/api/Notifications/scheduledCsv'
  tranId="mini-push-$dateStr"
  appid='"appId"'":"'"80e22f3bb1340514daca7265280c69f0"'
  token='"token"'":"'"starbucks20170221012740"'
  templateId='"templateId":"79"'
  content='"content":""'
  recipientsCsvPath='"recipientsCsvPath"'":"'"'$2'"'
  isPush='"isPush"'":"'"true"'



  count=`expr 15 \* $1`
  # TODO follow script is not supported in MAC
  scheduler=`date --date="$count minute" "+%Y-%m-%d %H:%M:%S"`

#  scheduler="$count minute"
  echo $scheduler

# TODO $scheduler
  sendTime='"sendTime"'":"'"'$scheduler'"'
#  sendTime='"sendTime"'":"'"2017-05-16 16:26:00"'
  ext_opts='"ext_opts":{"notifyType":"MINI_PROMOTION"}'

#  data="{"$appid","$token","$templateId","$content","$recipientsCsvPath","$isPush","$sendTime","$ext_opts"}"
  data='{"appId":"80e22f3bb1340514daca7265280c69f0","token":"starbucks20170221012740","templateId":"79","content":"","isPush":"true","ext_opts":{"notifyType":"MINI_PROMOTION"},"recipientsCsvPath":"'$2'","sendTime":"'$scheduler'"}'
  echo $data


  curl -X POST --connect-timeout 10 -m 5 --url $ncUrl -H 'content-type: application/json' -H "x-transaction-id: $tranId" \
  --data '{"appId":"80e22f3bb1340514daca7265280c69f0","token":"starbucks20170221012740","templateId":"79","content":"","isPush":"true","ext_opts":{"notifyType":"MINI_PROMOTION"},"recipientsCsvPath":"'$2'","sendTime":"'$scheduler'"}'

  dateStr=`date '+%Y%m%d-%H%M%S' `
  printf " ======> End to call NC at $dateStr ============>  \n "

}


# TODO
# 遍历所有文件，执行发送任务
i=0
for file in ${files[@]};
do
 i=`expr $i + 1`
 echo "$i ===> $file"
 callNotify $i $file
# break
done

exit 0