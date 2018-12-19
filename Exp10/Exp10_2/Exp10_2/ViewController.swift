//
//  ViewController.swift
//  Exp10_2
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myView2: UIView!
    
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        
        UIView.transition(with: myView, duration: 2, options: .transitionCurlUp, animations: {
            self.myView.backgroundColor = UIColor.black
        }, completion: nil)
        
        let imgView = UIImageView(frame: CGRect(x: 30, y: 30, width: myView2.bounds.width, height: myView2.bounds.height))
        imgView.image = UIImage(named: "1")
        UIView.transition(from: myView2, to: imgView, duration: 2, options: .transitionFlipFromLeft, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

