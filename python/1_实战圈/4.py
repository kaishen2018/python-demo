# python 实践圈第三天代码练习
# -*-coding:utf-8-*-
'''
第四天写代码，坚持下去
- python 数据结构
- 列表
- 字典
- 
'''



'''
--------------
列表

'''
#转义字符的处理
command = ' welcome To china'
# print('类型：', type(command))

str_arr = ['aaa', 'bbb', 'ccc']
# print('类型：', type(str_arr))
# print('第三个元素是{}'.format(str_arr[2]))

# add new element
str_arr.insert(3, 'ddd')
str_arr.append('eee')
str_arr.pop()
str_arr.remove('aaa')
# str_arr.reverse()
# print(str_arr[1::2])



'''
--------------
元组

'''

range = (1,2,3)
print(type(range))



'''
--------------
字典

'''
peoples={
  "MAN":100,
  "WOMEN": 200
}
peoples['CHILDREN']=50
del peoples['CHILDREN']
print(type(peoples))
print(peoples.values())


arr = [1,2,3]
peoples['QUEUE'] = arr

arr2 = [peoples, peoples]
print(peoples)
print(arr2)


