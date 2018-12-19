//
//  DetailViewController.swift
//  Exp12_2
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var person:Person?
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        lbName.text = person?.name
        lbPhone.text = person?.phone
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
