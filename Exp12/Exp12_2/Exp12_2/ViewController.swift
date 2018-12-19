//
//  ViewController.swift
//  Exp12_2
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    //应用代理
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
        appDelegate.saveContext()
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text
            appDelegate.saveContext()
        }
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            appDelegate.saveContext()
        }
    }
    
    @IBAction func query(_ sender: Any) {
        //构造请求对象
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        //查询，返回所有的person
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

