# 目标： 本文档是为了自动实现调用NC接口，生成定时任务，去 推送Mini Push 的消息的命令
# 执行方式：1. 需要更新每天的
# 作者：Kaishen Yang
# Date: 2018-6-7


#! /bin/bash

# MAP CSV ID TO TEMPLATE ID
# 5 -> 40
# 6 -> 41
# 7 -> 42
# 8 -> 43
# 9 -> 44
# 10 -> 46

today=`date '+%Y%m%d'`
yesterday=`date -v-1d '+%Y%m%d'`

# TODO need setup env.
  # DEV
  ncUrl='http://172.16.98.166:3001/api\notifications/scheduledCsv'

  #UAT
#  ncUrl='http://172.17.0.110:3001/api\notifications/scheduledCsv'

# PROD
#  ncUrl='http://172.17.0.150:3001/api\notifications/scheduledCsv'


declare -a files

# TODO
# 自动生成 所需文件列表
prepare() {
    fileName="/mini-push/mini-push-ID-DATE.csv"
    for((i=5;i<=10;i++));
    do
       echo $i
       temp=${fileName/ID/$i}
       temp=${temp/ID/$i}
       temp=${temp/DATE/$yesterday}
       echo $temp
       files=(${files[@]} $temp)
    done
}

# TODO 每天变更下文件名  == 开始==============================
# TODO 自动准备文件
# prepare


# TODO 手工准备文件
#files=(
#"/mini-push/mini-push-template-5-20180606.csv"
#"/mini-push/mini-push-template-6-20180606.csv"
#"/mini-push/mini-push-template-7-20180606.csv"
#"/mini-push/mini-push-template-8-20180606.csv"
#"/mini-push/mini-push-template-9-20180606.csv"
#"/mini-push/mini-push-template-10-20180606.csv"
#)

files=(
"/home/softtek/sftp/webpower-test-3-cn.csv"
"/home/softtek/sftp/webpower-test-3-cn.csv"
"/home/softtek/sftp/webpower-test-3-cn.csv"
)
# TODO 每天变更下文件名  == 结束==============================

# 调用NC API
# $1 -
# $2 - 文件路径
# $3 - 发送时间
# $4 - 模板ID
callNotify() {

  dateStr=`date "+%Y-%m-%d-%H:%M:%S"`

  echo " =========================================> begin to call NC  at $dateStr ============>\n" >> $today".txt"

  echo " ======> 方法参数：" $1 " / " $2 " / " $3 " / " $4 "\n" >> $today".txt"

  tranId="mini-push-$dateStr"
  appid='"appId"'":"'"80e22f3bb1340514daca7265280c69f0"'
  token='"token"'":"'"starbucks20170221012740"'
  # templateId='"templateId":"79"'
  content='"content":""'
  recipientsCsvPath='"recipientsCsvPath"'":"'"'$2'"'
  isPush='"isPush"'":"'"true"'


#  data="{"$appid","$token","$templateId","$content","$recipientsCsvPath","$isPush","$sendTime","$ext_opts"}"
  data='{"appId":"80e22f3bb1340514daca7265280c69f0","token":"starbucks20170221012740","templateId":"'$4'","content":"","isPush":"true","ext_opts":{"notifyType":"MINI_PROMOTION"},"recipientsCsvPath":"'$2'","sendTime":"'$3'"}'
  echo " ======> request body: $data \n"  >>  $today".txt"


  echo " ======> response body: " >> $today".txt"
   curl -X POST --connect-timeout 10 -m 5 --url $ncUrl -H 'content-type: application/json'  -H "x-transaction-id: $tranId" \
   -d '{"appId":"80e22f3bb1340514daca7265280c69f0","token":"starbucks20170221012740","templateId":"'$4'","content":"","isPush":"true","recipientsCsvPath":"'$2'","sendTime":"'"$3"'","ext_opts":{"notifyType":"MINI_PROMOTION"}}'   >>  $today".txt"



  dateStr=`date "+%Y-%m-%d %H:%M:%S"`
  echo "\n" >> $today".txt"
  echo " =========================================> End to call NC at $dateStr ============>  \n " >>  $today".txt"

}


# TODO
# 遍历所有文件，执行发送任务
i=0
for file in ${files[@]};
do

 i=`expr $i + 1`
 # 每20分钟推送一次
 m=`expr 20 \* $i`
 min=$m"M"

 scheduler=`date -v+$min "+%Y-%m-%d %H:%M:%S"`

# echo ${file:30:1}

 templateId=${file:30:1}

 if [ $templateId == 5 ]
 then
    templateId=40
 elif [ $templateId == 6 ]
 then
    templateId=41
 elif [ $templateId == 7 ]
 then
    templateId=42
 elif [ $templateId == 8 ]
 then
    templateId=43
 elif [ $templateId == 9 ]
 then
    templateId=44
 elif [ ${file:30:2} == 10 ]
 then
    templateId=46
 else
    echo "=======================>>>>>>>>>>>> templateId=others"
    templateId=731
 fi
 echo "=======================>>>>>>>>>>>> $templateId"
 callNotify "$i" "$file" "$scheduler" "$templateId"
# break
done

exit 0