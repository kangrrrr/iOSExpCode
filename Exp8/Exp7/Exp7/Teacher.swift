//
//  Student.swift
//  Exp7
//
//  Created by apple on 2018/11/26.
//  Copyright © 2018年 kr. All rights reserved.
//

import Foundation


//a)Teacher类增加属性title，实例可以直接用print输出；
class Teacher : Person{
    var title :String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender, title: String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    override var description: String {
        return "我是\(fullName)老师, 我今年\(age)岁.\n我的性别是\(gender). 我的称号是\(title)."
    }
    //c)Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
    override func run() {
        print("Teacher \(fullName) is running")
    }
}
