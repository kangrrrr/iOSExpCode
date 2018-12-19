//
//  Student.swift
//  Exp7
//
//  Created by apple on 2018/11/26.
//  Copyright © 2018年 kr. All rights reserved.
//

import Foundation


class Student : Person{
    var stuNo : Int
    
    init(firstName: String, lastName: String, age: Int, gender: Gender, stuNo : Int) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    override var description: String {
        return "我叫 \(fullName), 今年 \(age) 岁.\n我是一个可爱的学生，我的性别是 \(gender). 我的学号是 \(stuNo)."
    }
    //c)Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
    override func run() {
        print("Student \(fullName) is running")
    }
}
