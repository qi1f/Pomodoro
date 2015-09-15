//
//  SettingViewController.swift
//  Pomodoro
//
//  Created by Fan Qi on 9/15/15.
//  Copyright (c) 2015 f_qi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pomodoroPicker: UIPickerView!
    @IBOutlet weak var breakPicker: UIPickerView!
    
    var pomodoroTimeDuration = ["5", "10", "15", "20", "25", "30", "35", "40", "45"]
    var breakTimeDuration = ["5", "10", "15", "20", "25"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set setting view background color
        let settingRed: CGFloat = (228 / 255)
        let settingGreen: CGFloat = (241 / 255)
        let settingBlue: CGFloat = (254 / 255)
        view.backgroundColor = UIColor(red: settingRed, green: settingGreen, blue: settingBlue, alpha: 1.0)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int{
        if pickerView.tag == 0 {
            return pomodoroTimeDuration.count
        } else {
            return breakTimeDuration.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView.tag == 0 {
            return pomodoroTimeDuration[row]
        } else {
            return breakTimeDuration[row]
        }
    }
}
