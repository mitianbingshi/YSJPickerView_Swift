//
//  ViewController.swift
//  YSJPickerView_Swift
//
//  Created by 闫树军 on 16/4/19.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pickerView  :YSJPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView = YSJPickerView.init(frame: CGRectMake(0, kScreenHeight-240, kScreenWidth, 240))
        pickerView._delegate = self
        
        
        
        let btn = UIButton.init(type: UIButtonType.RoundedRect)
        btn.frame = CGRectMake(100, 100, 100, 100)
        btn.backgroundColor = UIColor.grayColor()
        btn.addTarget(self, action: #selector(ViewController.show), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func show() {
        pickerView.show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController :  YSJPickerViewDelegate{
    func PickerViewResult(string: String) {
        print(string)
    }
}

