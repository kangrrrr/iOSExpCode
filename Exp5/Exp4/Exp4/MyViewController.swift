//
//  MyViewController.swift
//  Exp4
//
//  Created by apple on 2018/11/26.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //设置view的背景颜色
        view.backgroundColor = UIColor.lightGray
        
        //生成label
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.yellow
        label.textAlignment = .center
        label.center = view.center
        //将label加入view
        view.addSubview(label)
        
        //生成button
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        btn.setTitle("Pick Me", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        //将button加入view
        view.addSubview(btn)
        
        //给button添加action（向self（target）发射action（selector）的操作）
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        //生成uiview，添加图片
        let img = UIImage(named: "dog")
        let imgView = UIImageView(frame: CGRect(x: 165, y: 150, width: 80, height: 100))
        imgView.image = img
        
        view.addSubview(imgView)
        
    }
    
    @IBAction func btnClicked(){
        if let label = view.subviews.first as? UILabel {
            label.text = "I am picked"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
