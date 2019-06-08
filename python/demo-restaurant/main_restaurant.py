# -*- coding: utf-8 -*-
# filename: main_restaurant.py
# author: Kaishen
# date: 2019-5-24 23:24

# system import
import datetime

# customer import
import restaurant


''' 打印门店信息 '''
my_rest = restaurant.Restaurant('重庆小面', '面馆', 20);
my_rest.introduce();

# 设置工作时间
my_rest.showWorkTime(9);
my_rest.showWorkTime(23);
print();

# 更新就餐人数
my_rest.changeEatingPeople(10);

# 获取当前时间
now_time = datetime.datetime.now();
print(f'当前时间为 {now_time} ')
my_rest.showWorkTime(now_time.hour);
print();

my_rest.showTotalCustomers();
my_rest.changeEatingPeople(15);
my_rest.changeEatingPeople(12);

print();

my_rest2 = restaurant.XMRestaurant('小时', '火锅', 10, '四川', 10)
my_rest2.introduce();

my_rest2.updateEmployee(2);
my_rest2.updateEmployee(-1);