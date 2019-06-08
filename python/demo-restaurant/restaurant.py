#! /usr/bin/python
# -*- coding: UTF-8 -*-
# filename: Restaurant.py
# author: Kaishen
# date: 2019-5-24 23:24

class Restaurant:
    """ 餐馆类 """
    def __init__(self, resName, resStyle, customers):
        self.resName = resName;
        self.resStyle = resStyle;
        self.customers = customers;
        self.workTime = '8:00 ~ 22:00'
    
    def introduce(self):
        print('欢迎在' + self.resName + self.resStyle + '就餐!');

    def showWorkTime(self, now):
        workTime = '本店营业时间为 {}'.format(self.workTime)
        print(workTime)

        if 22 > now > 8:
            print(f'当前时间是{now}, 餐厅正在营业');
        else:
            print(f'当前时间是{now}, 餐厅已经休息');

    def showTotalCustomers(self):
        print(f'total customer is ' + str(self.customers))

    def changeEatingPeople(self, newNum):
        if newNum > self.customers:
            print(f'由于 {newNum} < {self.customers}, 用餐人数不可修改,' r'请输入正确的用餐人数>{self.customers}')


class XMRestaurant(Restaurant) :
    def __init__(self, resName, resStyle, customers, huoguoStyle, employee):
        super().__init__(resName, resStyle, customers);
        self.huoguoStyle = huoguoStyle;
        self.employee = employee

    def introduce(self):
        print('weclome ' + self.resName + self.huoguoStyle + self.resStyle + ' have dinner');

    def updateEmployee(self, newEmployee):
        if newEmployee < 0:
            self.employee = self.employee + newEmployee;
            print('离职员工为：' + str(abs(newEmployee)) + '人。员工总人数修改为： ' + self.employee);
        else:
            self.employee = self.employee + newEmployee;
            print('新入职员工为：' + str(abs(newEmployee)) + '人。员工总人数修改为： ' + self.employee);



