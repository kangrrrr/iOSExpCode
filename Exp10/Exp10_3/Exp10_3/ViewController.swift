//
//  ViewController.swift
//  Exp10_3
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    //重力
    let gravity = UIGravityBehavior()
    //碰撞
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: UIButton) {
        
        let width = Int(backView.bounds.width / 10)
        let x = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: x, y: 0, width: width, height: width))
        label.backgroundColor = UIColor.green
        label.text = "R"
        label.textAlignment = .center
        self.backView.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
    }
    @IBAction func up(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    @IBAction func del(_ sender: UIButton) {
        for item in backView.subviews {
            if item is UILabel {
                item.removeFromSuperview()
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    
}

