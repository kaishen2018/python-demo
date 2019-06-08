import requests

# 接口的url
url = "http://fanyi.baidu.com/v2transapi"

# 接口的参数
params = {
    "from":"en",
    "to":"zh", 
    "query": "test"
}

r = requests.request("post", url, params=params)

# 打印返回结果
print("result from server: {}".format(r.text))

# 为了让结果看的更加清楚一点，我取来翻译的字段
import json
d = json.loads(r.text)
print("Formatted result from server: {}".format(d['query']))