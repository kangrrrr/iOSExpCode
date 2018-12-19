//
//  ViewController.swift
//  Exp7
//
//  Created by apple on 2018/11/26.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var personArray = [Person]()
    
    @IBOutlet weak var lbShowInfo: UILabel!
    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfSecondName: UITextField!
    
    @IBOutlet weak var stuAndTeacherTableView: UITableView!
    
    var num = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //生成学生、老师
        for i in 1...6 {
            if i % 2 == 1 {
                let t = Teacher(firstName: "Smith", lastName: "", age: 24 + i, gender: Gender.male, title: "初级")
                personArray.append(t)
            } else {
                let t = Teacher(firstName: "Lily", lastName: "", age: 24 + i, gender: Gender.famale, title: "高级")
                personArray.append(t)
            }
        }
        
        for i in 1...4 {
            if i % 2 == 1 {
                let s = Student(firstName: "Krista", lastName: "", age: 15 + i, gender: Gender.famale, stuNo: i)
                personArray.append(s)
            } else {
                let s = Student(firstName: "Mark", lastName: "", age: 15 + i, gender: Gender.male, stuNo: i)
                personArray.append(s)
            }
        }
        //排序
        personArray = personArray.sorted{$0.gender > $1.gender}
        
    }
    

    //tableview行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    //增加学生
    @IBAction func add(_ sender: UIButton) {
        if let firstName = tfFirstName.text,let secondName = tfSecondName.text {
            if num % 2 == 1 {
                let stu = Student(firstName: firstName, lastName: secondName, age: 18, gender: Gender.famale, stuNo: num)
                personArray.append(stu)
            } else {
                let stu = Student(firstName: firstName, lastName: secondName, age: 17, gender: Gender.male, stuNo: num)
                personArray.append(stu)
            }
            num += 1
            stuAndTeacherTableView.reloadData()
            
        }
        tfFirstName.resignFirstResponder()
        tfSecondName.resignFirstResponder()
    }
    //修改
    @IBAction func edit(_ sender: UIButton) {
        if let row = stuAndTeacherTableView.indexPathForSelectedRow?.row {
            if let firstName = tfFirstName.text,let secondName = tfSecondName.text {
                personArray[row].firstName = firstName
                personArray[row].lastName = secondName
                stuAndTeacherTableView.reloadData()
            }
        }
    }
    //删除
    @IBAction func del(_ sender: UIButton) {
        stuAndTeacherTableView.isEditing = !stuAndTeacherTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            personArray.remove(at: indexPath.row)
            stuAndTeacherTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//    }
    
    //根据类型选择对应的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if personArray[indexPath.row] is Student {
            //如果是Student
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            let stu = personArray[indexPath.row] as! Student
            let stuName = stu.fullName
            let stuNo = stu.stuNo
            cell.lbStuName.text = stuName
            cell.lbStuNo.text = String(stuNo)
            cell.imgStu.image = UIImage(named: "dog")
            return cell
        } else {
            //如果是学生
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            let tea = personArray[indexPath.row] as! Teacher
            let teaName = tea.fullName
            let teaTitle = tea.title
            cell.lbTeaName.text = teaName
            cell.lbTeaTitle.text = teaTitle
            cell.imgTeacher.image = UIImage(named: "cat")
            return cell
        }
    }
    //显示选中的cell信息
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lbShowInfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        lbShowInfo.numberOfLines = 0
        lbShowInfo.text = personArray[indexPath.row].description
    }
    //设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

