import UIKit
//1.    显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
//a)    显示中文需要设置locale

let nowDate = Date()

let dateFormatter = DateFormatter()
dateFormatter.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
dateFormatter.dateFormat = "yyyy年MM月dd日EEEE aahh:mm"

let bj = dateFormatter.string(from: nowDate)
print("北京 \(bj)")

dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
let dj = dateFormatter.string(from: nowDate)
print("东京 \(dj)")

dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
let ny = dateFormatter.string(from: nowDate)
print("纽约 \(ny)")

dateFormatter.timeZone = TimeZone(identifier: "Europe/London")
let ld = dateFormatter.string(from: nowDate)
print("伦敦 \(ld)")

//2.    处理字符串
//a)    新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；

var str : String = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

//b)    返回字符串从第6个字符到第20个字符的子串；

let startIndex = str.index(str.startIndex, offsetBy:5)
let endIndex = str.index(str.startIndex, offsetBy: 20)

let subStr = str[startIndex..<endIndex]
print(subStr)

//c)    删除其中所有的OS字符；

let replaceStr = str.replacingOccurrences(of: "OS", with: "")
print(replaceStr)

//3.    将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；

let dic = ["bj" : bj, "dj" : dj, "ny" : ny, "ld" : ld, "str" : str]

let defaultDoc = FileManager.default
if var path = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
    path.append("/test.txt")
    
    let dic_store =  dic as NSDictionary
    
    dic_store.write(toFile: path, atomically: true)
}

//4.    从网上下载一张照片并保存到本地沙盒的Document的某文件中；

let imgUrl = URL(string: "https://fanyi.bdstatic.com/static/translation/img/header/logo_cbfea26.png")
let imgData = try!Data(contentsOf: imgUrl!)
if var url = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first {
    url.appendPathComponent("img.png")
    try imgData.write(to: url)
}

//5.    从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；

let url = URL(string: "http://www.weather.com.cn/data/sk/101100101.html")!
let data = try Data(contentsOf: url)
let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

if let dic = json as? [String: Any] {
    if let weather = dic["weatherinfo"] as? [String: Any] {
        let city = weather["city"]!
        let temp = weather["temp"]!
        let wd = weather["WD"]!
        let ws = weather["WS"]!
        print("城市: \(city), 温度: \(temp), 风向: \(wd), 风力: \(ws)")
    }
}





