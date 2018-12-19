//
//  Person.swift
//  Exp7
//
//  Created by apple on 2018/11/26.
//  Copyright © 2018年 kr. All rights reserved.
//

import Foundation

//枚举类型（male，female）
enum Gender : String {
    case male
    case famale
    
    static func >(g1 : Gender, g2 : Gender) -> Bool{
        return g1.rawValue > g2.rawValue
    }
}

class Person : CustomStringConvertible {
    //a)要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    
    //fullName计算属性
    var fullName : String {
        get{
            return firstName + lastName
        }
    }
    
    //b)具有指定构造函数和便利构造函数；
    init(firstName:String, lastName:String, age:Int, gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    //便利构造函数；
    convenience init(gender:Gender) {
        self.init(firstName: "", lastName: "", age: 18, gender: Gender.famale)
    }
    
    //c)两个Person实例对象可以用==和!=进行比较；
    static func ==(p1:Person, p2:Person) -> Bool {
        if p1.firstName == p2.firstName && p1.lastName == p2.lastName && p1.age == p2.age && p1.gender == p2.gender{
            return true
        }else {
            return false
        }
    }
    
    static func !=(p1:Person, p2:Person) -> Bool {
        if p1.firstName != p2.firstName || p1.lastName != p2.lastName || p1.age != p2.age || p1.gender != p2.gender{
            return true
        }else {
            return false
        }
    }
    
    //d)Person实例可以直接用print输出；
    var description: String {
        return "My name is \(fullName).\nI'm \(age) years old.\n I'm a cute \(gender)."
    }
    
    //e)Person增加run方法(方法里面直接print输出Person XXX is running;
    func run() {
        print("Person \(fullName) is running.")
    }
}
