//
//  YSJPickerView.swift
//  YSJPickerView_Swift
//
//  Created by 闫树军 on 16/4/19.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

let kScreenWidth           = CGRectGetWidth(UIScreen.mainScreen().bounds)
let kScreenHeight          = CGRectGetHeight(UIScreen.mainScreen().bounds)

protocol YSJPickerViewDelegate {
    func PickerViewResult(string:String)
}


class YSJPickerView: UIView {

    var pickerView          :UIPickerView!
    var cancelBtn           :UIButton!
    var commitBtn           :UIButton!
    var _pickerViewBackground :UIView!
    var _window             :UIWindow!
    var _pickerDataSource   :NSArray! = [""]
    var _delegate           :YSJPickerViewDelegate!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.groupTableViewBackgroundColor()
        _pickerDataSource = NSArray.init(objects: "中国大陆身份证","中国护照","香港身份证","澳门身份证","台湾身份证","港澳居民来往内地通行证","台湾居民来往内地通行证")
        
        
        pickerView = UIPickerView.init(frame: CGRectMake(0, 40, kScreenWidth, 200))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0,inComponent:0,animated:true)
        self.addSubview(pickerView)
        
        
        _pickerViewBackground = UIView.init(frame: UIScreen.mainScreen().bounds)
        _pickerViewBackground.backgroundColor = UIColor.clearColor()
        _pickerViewBackground.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(YSJPickerView.hidden)))
        
        commitBtn = UIButton.init(type: UIButtonType.RoundedRect)
        commitBtn.setTitle("确定", forState: UIControlState.Normal)
        commitBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        commitBtn.frame = CGRectMake(kScreenWidth - 60, 10, 40, 20)
        commitBtn.addTarget(self, action: #selector(YSJPickerView.commit), forControlEvents: .TouchUpInside)
        self.addSubview(commitBtn)
        
        
        cancelBtn = UIButton.init(type: UIButtonType.RoundedRect)
        cancelBtn.setTitle("取消", forState: UIControlState.Normal)
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        cancelBtn.frame = CGRectMake(20, 10, 40, 20)
        cancelBtn.addTarget(self, action: #selector(YSJPickerView.cancel), forControlEvents: .TouchUpInside)
        self.addSubview(cancelBtn)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  显示
    func show() {
        _window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        _window.windowLevel = UIWindowLevelAlert+1
        _window.backgroundColor = UIColor.clearColor()
        _window.hidden = true
        _window.userInteractionEnabled = true
        _window.addSubview(_pickerViewBackground)
        _window.addSubview(self)
        
        _window.hidden = false
        UIView.animateWithDuration(0.2, animations: {
            self._pickerViewBackground.backgroundColor = UIColor.init(white: 0.0, alpha: 0.2)
            self.frame = CGRectMake(0, kScreenHeight - 240, kScreenWidth, 240)
        })

    }
    
    
    func hidden() {
        UIView.animateWithDuration(0.2, animations: {
            self._pickerViewBackground.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
            self.frame = CGRectMake(0, kScreenHeight , kScreenWidth, 240)
        }) { (finished) in
            self._window = nil
        }
        
    }
    
    func commit() {
        _delegate.PickerViewResult(_pickerDataSource[pickerView.selectedRowInComponent(0)] as! String)
        
        hidden()
    }
    
    func cancel() {
        hidden()
    }

}


// MARK: - UIPickerViewDelegate
extension YSJPickerView : UIPickerViewDelegate{
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _pickerDataSource[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
}


// MARK: - UIPickerViewDataSource
extension YSJPickerView :UIPickerViewDataSource{
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }

}













