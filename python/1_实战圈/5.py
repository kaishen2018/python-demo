# python 实践圈第三天代码练习
# -*-coding:utf-8-*-
'''
第五天写代码，坚持下去
- 函数
- 
'''

from employee import *

import os

'''
--------------
列表

'''

def sum(a, b): 
  return a+b

def swap(a,b):
    tmp = a
    a = b;
    b=tmp;

def wec(name, welcome):
  print(welcome + ' ' + name)

def welcomeAll(*args):
  for name in args:
    print('welcome {}'.format(name))

def student(firstName, lastName, **info):
  '''
  create dictionary, save info
  '''
  student = {}
  student['firstName'] = firstName
  student['lastName'] = lastName
  for key, value in info.items():
     print(key + ' ' + value)
     student[key]=value
  return student

        

a,b = '1','2'    
print(sum(a,b))  
swap(a,b)
print(a,b)

name = 'kaishen'
weclome = 'welcome'
wec(weclome, name)

welcomeAll('kaishen', 'irain')

firstName = 'Yang'
lastName = 'kai'


s = student(firstName, lastName, age="10", location='BJ')
print(s)

emp = employee("kaishen", 10000)
print(emp)


print(os.listdir('./'))
# os.mkdir('test')
os.rmdir('test')