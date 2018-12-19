import UIKit
//var dic = [String:Int]()

//（1）    给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;
var dic = [["name" : "Lily", "age" : 15],["name" : "Mary", "age" : 16],["name" : "Mark", "age" : 17]]

var age = dic.map{"\($0["age"]!)"}

print(age)

//（2）    给定一个String数组，用filter函数选出能被转成Int的字符串
var array : [String] = ["213","mjasfb","1.23","ncaisbc","cbfhas","24612","naisbcia"]

print(array.filter({Int($0) != nil}))

//（3）    用reduce函数把String数组中元素连接成一个字符串，以逗号分
print(array.reduce("", {
    if $0 == "" {
        return $1
    }else {
        return $0 + "," + $1
    }
}))

//（4）    用 reduce 方法一次求出整数数组的最大值、最小值、总数和
var intArray : [Int] = [123,345,6,783,82,98,91]

print(intArray.reduce((max : Int.min, min : Int.max, sum : 0), { (a1,a2) in
    return (max(a1.max,a2),min(a1.min, a2),a1.sum+a2)
}))

//（5）    新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
func f1(a : Int) -> Int {
    return a
}

func f2(a : String) -> String {
    return a
}

func f3(a : Int) {
    
}

func f4() -> Int {
    return 1
}

func f5(a : Int, b : Int) -> Int {
    return a + b
}

func f6(a : Int) -> Int {
    return a - 3
}

var funcArray : [Any] = [f1,f2,f3,f4,f5,f6]

print(funcArray.filter({ (f) -> Bool in
    if f is (Int) -> Int {
        return true
    }else {
        return false
    }
}))



//（6）    扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
extension Int{
    func sqrt() -> Double {
        return Darwin.sqrt(Double(self))
    }
}

let num = 20
print(num.sqrt())

//（7）    实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
func maxAndMin<T:Comparable>(num : [T]) -> (max : T, min : T){
    return num.reduce((max : num[0], min : num[1]), { (a1, a2) in
        return (max(a1.max, a2),min(a1.min, a2))
    })
}

//func maxAndMin<T:Comparable>(num : [T]) -> (max : T, min : T){
//    var max = num[0]
//    var min = num[0]
//    for i in num {
//        if max < i {
//            max = i
//        }
//        if min > i {
//            min = i
//        }
//    }
//    return (max,min)
//}

var intArray1 = [213,342,453,23]

var doubleArray = [11.1,2.0,2.1]

var stringArray = ["aaa","bbb","c"]
print(maxAndMin(num: intArray1))
print(maxAndMin(num: doubleArray))
print(maxAndMin(num: stringArray))
