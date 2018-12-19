//
//  SecondViewController.swift
//  Exp11_1
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var stuNO = ""
    var stuName = ""
    
    @IBOutlet weak var tfstuNo: UITextField!
    @IBOutlet weak var tfStuName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfstuNo.text = stuNO
        tfStuName.text = stuName
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
        stuNO = tfstuNo.text!
        stuName = tfStuName.text!
        
        for vc in self.navigationController!.viewControllers {
            if let firstVC = vc as? FirstViewController {
                firstVC.stuNO = stuNO
                firstVC.stuName = stuName
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
