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
        return "My name is \(fullName), I'm \(age) years old, I'm a cute \(gender)."
    }
}

var p1 = Person(firstName: "Smith", lastName: "Anthony", age: 18, gender: Gender.male)
var p2 = Person(firstName: "Mark", lastName: "Lily", age: 16, gender: Gender.famale)
var p3 = p1



print("**************")

if(p1 == p2){
    print("==")
}else{
    print("!=")
}

if(p1 != p3){
    print("!=")
}else{
    print("==")
}

print("**************")

print(p1)

//a)Teacher类增加属性title，实例可以直接用print输出；
class Teacher : Person {
    var title :String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender, title: String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    override var description: String {
        return "My name is \(firstName) \(lastName), I'm \(age) years old, I'm a \(gender) teacher. My title is \(title)."
    }
}

var t1 = Teacher(firstName: "Kary", lastName: "Lisa", age: 26, gender: Gender.famale, title: "高级")


print("**************")

print(t1)

//b)Student类增加属性stuNo，实例可以直接用print输出；
class Student : Person {
    var stuNo : Int
    
    init(firstName: String, lastName: String, age: Int, gender: Gender, stuNo : Int) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    override var description: String {
        return "My name is \(firstName) \(lastName), I'm \(age) years old, I'm a \(gender) teacher. My stuNo is \(stuNo)."
    }
}

var stu1 = Student(firstName: "Krista", lastName: "Mary", age: 16, gender: Gender.famale, stuNo: 7)


print("**************")

print(stu1)

//（3）分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var array = [Person]()

for i in 1...5 {
    let p = Person(firstName: "Mark", lastName: "", age: 15 + i, gender: Gender.male)
    array.append(p)
}

for i in 1...6 {
    let t = Teacher(firstName: "Smith", lastName: "", age: 24 + i, gender: Gender.male, title: "初级")
    array.append(t)
}

for i in 1...4 {
    let s = Student(firstName: "Krista", lastName: "", age: 15 + i, gender: Gender.famale, stuNo: i)
    array.append(s)
}
//a)分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
var num = ["Person" : 0, "Teacher" : 0, "Student" : 0]

for i in array {
    if i is Teacher {
        num["Teacher"]! += 1
    }else if i is Student {
        num["Student"]! += 1
    }else {
        num["Person"]! += 1
    }
}

print("**************")


for (key,value) in num {
    print("\(key) \(value)")
}

print("**************")
//b)对数组按以下要求排序并输出：age、fullName、gender+age；
//age
let array1 = array.sorted{$0.age < $1.age}
for i in array1 {
    print(i)
}

print("**************")
//fullName
let array2 = array.sorted{$0.fullName < $1.fullName}
for i in array2 {
    print(i)
}

print("**************")

//let array3 = array.sorted{($0.gender < $1.gender) && ($0.age > $1.age)}
//for i in array3 {
//    print(i)
//}
//gender+age；
let array3 = array.sorted {
    if $0.age == $1.age{
        return $0.gender > $1.gender
    }else {
        return $0.age > $1.age
    }
}
for i in array3 {
    print(i)
}

