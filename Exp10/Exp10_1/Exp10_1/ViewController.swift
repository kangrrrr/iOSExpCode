//
//  ViewController.swift
//  Exp10_1
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak weakSelf = self] (mytimer) in
            weakSelf?.myView.center.x += 20
        })
    }

    
    @IBAction func btnClicked(_ sender: UIButton) {
        timer?.invalidate()
//        UIView.animate(withDuration: 2) {
//            self.myView.alpha = 0
//        }
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear,.autoreverse,.repeat], animations: {
            self.myView.alpha = 0
            self.myView.center.x = self.view.bounds.width
            //self.myView.backgroundColor = UIColor.green
            //rotation:旋转  scaledBy:缩小
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
//            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            //
//            self.myView.transform = CGAffineTransform.identity
        }) { (finished) in
            //结束时
            if finished {
                self.myView.removeFromSuperview()
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

