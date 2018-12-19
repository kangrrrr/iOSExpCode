//
//  ViewController.swift
//  Exp11_1
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var stuNO = ""
    var stuName = ""

    @IBOutlet weak var tfStuNO: UITextField!
    @IBOutlet weak var tfStuName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfStuNO.text = stuNO
        tfStuName.text = stuName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSecondVC(_ sender: Any) {
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secVC.stuNO = tfStuNO.text!
        secVC.stuName = tfStuName.text!
        self.navigationController?.pushViewController(secVC, animated: true)
        //present(secVC, animated: true, completion: nil)
    }
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        present(thirdVC, animated: true, completion: nil)
    }
    

}

