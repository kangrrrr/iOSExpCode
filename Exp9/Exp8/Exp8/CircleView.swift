//
//  CircleView.swift
//  Exp8
//
//  Created by apple on 2018/11/27.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {

//    @IBInspectable var fillColor : UIColor?
//    @IBInspectable var strokeColor : UIColor?
//    
//    func setup() {
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
//        self.addGestureRecognizer(panRecognizer)
//        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(_:)))
//        self.addGestureRecognizer(pinchRecognizer)
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
//        self.addGestureRecognizer(tapRecognizer)
//        
//        tapRecognizer.numberOfTouchesRequired = 1
//        tapRecognizer.numberOfTapsRequired = 2
//    }
//    
//    //
//    @objc func tap(_ recognizer : UITapGestureRecognizer){
//        switch recognizer.state {
//        case .recognized:
//            print("double")
//        default:
//            break
//        }
//    }
//    
//    //缩放
//    @objc func pinch(_ recognizer : UIPinchGestureRecognizer){
//        switch recognizer.state {
//        case .changed:
//            fallthrough
//        case .ended:
//            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
//            recognizer.scale = 1
//        default:
//            break
//        }
//    }
//    
//    //拖拽移动
//    @objc func pan(_ recognizer : UIPanGestureRecognizer){
//        switch recognizer.state {
//        case .changed:
//            fallthrough
//        case .ended:
//            let translation = recognizer.translation(in: self)
//            center.x += translation.x
//            center.y += translation.y
//            recognizer.setTranslation(.zero, in: self)
//        default:
//            break
//        }
//    }
//    
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//        let path = UIBezierPath(ovalIn: rect)
//        fillColor?.setFill()
//        strokeColor?.setStroke()
//        path.fill()
//        path.stroke()
//    }
//    

}
