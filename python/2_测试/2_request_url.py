#! /usr/bin/python
# -*- coding: UTF-8 -*-
# 文件名：2.py
# 利用 unittest 框架来生成测试报告

import requests, unittest, json


class Testbaiduapi(unittest.TestCase):
    def setUp(self):
        url = "https://api.github.com"

    def testGet(self):
        params = {
            "from": "en",
            "to": "zh",
            "query": "study"  #
        }
        url = "https://api.github.com"
        r = requests.request("get", url, params=params)
        r = json.loads(r.text)
        self.assertIn('current_user_url', r)

    def testPost(self):
        params = {
            "from": "en",
            "to": "h",
            "query": "stud"  #
        }
        url = "https://api.github.com"
        r = requests.request("post", url, params=params)
        d = json.loads(r.text)
        # assert u'message' in r
        # print("response is {}".format(d))
        # print("response is {}".format(d['message']))
        self.assertEqual("Not Found", d['message'])

    def tearDown(self):
        pass


if __name__ == '__main__':
    unittest.main(verbosity=2)