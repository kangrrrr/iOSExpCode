//
//  ViewController.swift
//  Exp8_3
//
//  Created by apple on 2018/11/27.
//  Copyright © 2018年 kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载6张图片
        for i in 1...6 {
            let imgView1 = UIImageView(image: UIImage(named: "\(i)"))
            //自适应
            imgView1.contentMode = .scaleAspectFit
            //设置imgview
            imgView1.frame = CGRect(x: CGFloat(i - 1) * scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
            scrollView1.addSubview(imgView1)
            //按页数滑动
            scrollView1.isPagingEnabled = true
        }
        //设置scrollview总大小
        scrollView1.contentSize = CGSize(width: 6 * scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.delegate = self
        //不显示滚动条
        scrollView1.showsHorizontalScrollIndicator = false
        //
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        
        
        let imgView2 = UIImageView(image: UIImage(named: "3"))
        scrollView2.addSubview(imgView2)
        scrollView2.contentSize = imgView2.bounds.size
        scrollView2.minimumZoomScale = 0.2
        scrollView2.maximumZoomScale = 5
        scrollView2.delegate = self
    }
    //图片改变时同时改变
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView1.bounds.width)
    }
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.scrollRectToVisible(rect, animated: true)
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView2.subviews.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

