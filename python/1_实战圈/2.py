# python 实践圈第三天代码练习
'''
第一天写代码，坚持下去
夯实基础数据结构
- 数据类型
  - 数字类型
  - 布尔类型
  - 字条串类型
  - 类型转换
- 注释

'''


'''
-------------
数字运算
'''
add = 3+5
print('3+5的值是{}'.format(add))

multip = 23*2
print('23*2的值是{}'.format(multip))


power = 2**3
print('2的立方是{}'.format(power))
print(f'2的立方是{power}')


'''
-----------
布尔运算
'''
a = True
print(a and 'a=T' or 'a=F')


'''
--------------
字符串
'''
#转义字符的处理
command = 'let\'s go!'
print('使用转义字符 的输出为：', command)

result = 'success'
print('拼接后的字条 串为：', command + result)