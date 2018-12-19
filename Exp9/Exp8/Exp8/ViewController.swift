//
//  ViewController.swift
//  Exp8
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

    @IBAction func add(_ sender: UIButton) {
        //随机生成label
        let x = Int(arc4random()) % Int(view.bounds.width - 60)
        let y = Int(arc4random()) % Int(view.bounds.height - 60)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 60, height: 60))
        label.text = "R"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        //增加阴影
        label.layer.shadowColor = UIColor.gray.cgColor
        label.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowOpacity = 1
        //添加label
        view.addSubview(label)
        
        //可交互
        label.isUserInteractionEnabled = true
        //pan
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        label.addGestureRecognizer(panRecognizer)
        //tap
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        label.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
        //pinch
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(_:)))
        label.addGestureRecognizer(pinchRecognizer)
        //rotation
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(_:)))
        label.addGestureRecognizer(rotationRecognizer)
    }
    
    //rotation
    @objc func rotation(_ recognizer : UIRotationGestureRecognizer){
        recognizer.view?.transform = CGAffineTransform(rotationAngle: recognizer.rotation)
    }
    
    
    //缩放
    @objc func pinch(_ recognizer : UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            recognizer.view?.bounds.size = CGSize(width: (recognizer.view?.bounds.width)! * recognizer.scale, height: (recognizer.view?.bounds.height)! * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    
    //删除
    @objc func tap(_ recognizer : UITapGestureRecognizer){
        switch recognizer.state {
        case .recognized:
            recognizer.view?.removeFromSuperview()
        default:
            break
        }
    }
    
    //拖拽移动
    @objc func pan(_ recognizer : UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    
    @IBAction func move(_ sender: UIButton) {
        for label in view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width - 60)
                    let y = Int(arc4random()) % Int(self.view.bounds.height - 60)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
            }
        }
    }
    @IBAction func del(_ sender: UIButton) {
        for label in view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    
}

