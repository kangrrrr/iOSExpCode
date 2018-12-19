import Foundation

func check(num : Int) -> Bool {
    for i in 2..<num {
        if(num % i == 0){
            return false
        }
    }
    return true
}

var numArray = [Int]()
let sep = "****************************"

for num in 2...50 {
    if(check(num: num) == true){
        numArray.append(num)
    }
}

print(numArray)

print(sep)

print("逆序输出1")
for i in numArray.reversed() {
    print(i)
}

print(sep)

print("逆序输出2")

func des(n1:Int, n2:Int) -> Bool {
    return n1 > n2
}

let numArraySorted2 = numArray.sorted(by: des)

print(numArraySorted2)


print(sep)

print("逆序输出3")
//闭包可以指定参数类型
let numArraySorted3 = numArray.sorted { (n1:Int, n2:Int) -> Bool in
    return n1 > n2
}

print(numArraySorted3)

print(sep)

print("逆序输出4")

//闭包可以不用指定参数类型
let numArraySorted4 = numArray.sorted { (n1, n2) -> Bool in
    return n1 > n2
}

print(numArraySorted4)

print(sep)

print("逆序输出5")

//闭包可以省略参数名，直接根据数字来引用每个参数（$0，$1，$2......）
let numArraySorted5 = numArray.sorted {
    return $0 > $1
}

print(numArraySorted5)

print(sep)

print("逆序输出6")

//闭包可以省略参数名，直接根据数字来引用每个参数（$0，$1，$2......）
let numArraySorted6 = numArray.sorted {$0 > $1}

print(numArraySorted6)

print(sep)

