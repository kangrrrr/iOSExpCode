//
//  ViewController.swift
//  Exp8_2
//
//  Created by apple on 2018/11/27.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "action sheet", message: "please choose color", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "RED", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "GREEN", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "BLUE", style: .destructive, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        alert.addAction(UIAlertAction(title: "WHITE", style: .cancel, handler: { (action) in
            self.view.backgroundColor = UIColor.white
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func alert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "login message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text, let password = alert.textFields?.last?.text else {
                return
            }
            print("username = \(username) password = \(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        alert.addTextField { (textfield) in
            textfield.placeholder = "your user name"
        }
        alert.addTextField { (textfield) in
            textfield.placeholder = "your password"
            textfield.isSecureTextEntry = true
        }
        
        present(alert, animated: true, completion: nil)
    }
}

