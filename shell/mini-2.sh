#!/bin/sh
echo -n "enter the request host: "
read host # request host

#cookie
echo -n "use cookie ? (y/n)  "
read is_cookie

cookie=""

#if need cookie set
if [[ $is_cookie = "y" ]]; then
  echo -n "input the cookie: "
  read input_cookie
  cookie=$input_cookie
fi

echo -n "need post? (y/n)  "
read tag

#http get if tag = n
if [[ $tag = "n" ]]; then
  if [[ $cookie != "" ]]; then
    curl $host -b$cookie
  else
    curl $host
  fi
  exit 0
fi

#the json data need to post
data=""

#the input value pair
kv_pair=""

while true; do
  if [[ $tag = "y" ]]; then
  #input key
  echo -n "key :  "
  read key

   # set break condition key = gameover 这里是一个循环结束的标志.输入这个标志表示我需要传递的json数据已经全部写进去了
    if [[ $key = "gameover" ]]; then
    #complete the json format, %,*  start at right side and romove the first ','
    kv_pair=${kv_pair%,*}

    #this is the last data to post
    data="{"$kv_pair"}"
    echo "post data is: $data and exce the curl cmd"
    #curl $host -d$data
    break;
    fi

  #encode with ""
  key='"'$key'"'

  #input value
  echo -n "value : "
  read value

  #encode value with ""
  value='"'$value'"'

  #set value pair and extends itself
  kv_pair="$kv_pair"$key":"$value","
  echo "$kv_pair"
  fi

done

#do http post
if [[ $cookie != "" ]]; then
  curl $host -d$data -b$cookie
else
  curl $host -d$data
fi
