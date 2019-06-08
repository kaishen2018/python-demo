#! /usr/bin/python
# -*- coding: UTF-8 -*-
# 文件名：1.py

# --- test if else
if True:
    print ("Answer")
    print ("True")
else:
    print ("Answer")
# 没有严格缩进，在执行时保持
print ("False")

print ("你好！Hello!")

# test express and swap line
total = 1 + \
        2 + \
        3

print (total)

# test array
days = ['Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday']

print (days[1])

# test quote
word = 'word'
sentence = "这是一个句子。"
paragraph = """这是一个段落。
包含了多个语句"""

print (paragraph + word + sentence)

# another test
import sys;
x = 'runoob'; sys.stdout.write(x + '\n')

