# python 实践圈第三天代码练习
# -*-coding:utf-8-*-
'''
第6天写代码，坚持下去
- 对象
- 
'''

class Person:
  # init
  def __init__(self, name, age, blood_type):
    self.name = name
    self.age = age
    self.blood_type =blood_type

  def detail(self):
    temp = 'i am %s, age %s, blood type %s ' %(self.name, self.age, self.blood_type)
    print (temp)

zhangsan = Person('zhangsan', 18, 'A')
zhangsan.detail()


class People(Person):
  def __init__(self, name, job):
    super().__init__(name, 19, 'B')
    self.name = name
    self.job = job
  
  def introduce(self):
    introduce = 'i am {n},  my job is {j}'.format(n = self.name, j=self.job)
    print(introduce)

man = People('man', 'java engineer')
man.introduce()
man.detail()