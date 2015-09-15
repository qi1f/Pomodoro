//
//  ViewController.swift
//  Pomodoro
//
//  Created by Fan Qi on 8/15/15.
//  Copyright (c) 2015 f_qi. All rights reserved.
//

import UIKit

class PomodoroViewController: UIViewController {
    
    var timer: NSTimer?
    var pomodoroTime: Int = 25
    var breakTime: Int = 5
    var takeABreak: Bool = false
    
    var isCounting = false {
        willSet(newValue) {
            if newValue {
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTime", userInfo: nil, repeats: true)
            } else {
                timer?.invalidate()
                timer = nil
            }
        }
    }
    var remainingSeconds = 0 {
        willSet(newSeconds) {
            let mins = newSeconds / 60
            let seconds = newSeconds % 60
            displayTimeLabel.text = NSString(format: "%02d:%02d", mins, seconds) as String
        }
    }
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    @IBOutlet weak var startStopButtonImage: UIButton!
    
    @IBAction func startStopButton(sender: AnyObject) {
        
        isCounting = !isCounting
        
        if isCounting {
            // Set stopButton image
            let stopButtonImage = UIImage(named: "stopButton.png")
            let stopButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            stopButtonImageView.image = stopButtonImage
            startStopButtonImage.addSubview(stopButtonImageView)
        } else {
            setStartButtonImage()
            // Stop counting
            isCounting = false
            remainingSeconds = pomodoroTime * 60
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        setBackgroundColor()
        // displayTimeLabel background circle
        let displayTimeLabelImage = UIImage(named: "displayTimeLabel.png")
        let displayTimeLabelImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 260, height: 260))
        displayTimeLabelImageView.image = displayTimeLabelImage
        displayTimeLabel.addSubview(displayTimeLabelImageView)
        // Initial pomodoro time
        remainingSeconds = pomodoroTime * 60
    }
    
    func updateTime() {
        remainingSeconds -= 1
        
        if takeABreak == true {
            if remainingSeconds <= 0 {
                isCounting = false
                takeABreak = false
                remainingSeconds = pomodoroTime * 60
                
                let alert = UIAlertView()
                alert.title = "Ready for some work?"
                alert.addButtonWithTitle("Why not?!")
                alert.show()
                
                setBackgroundColor()
                setStartButtonImage()
            }
        } else {
            if remainingSeconds <= 0 {
                isCounting = false
                takeABreak = true
                remainingSeconds = breakTime * 60
                
                let alert = UIAlertView()
                alert.title = "1 Pomodoro Completed!"
                alert.message = "Good Job!"
                alert.addButtonWithTitle("OK")
                alert.show()
                
                setBackgroundColor()
                setStartButtonImage()
            }
        }
    }
    
    func setStartButtonImage() {
        // Set startButton image
        let startButtonImage = UIImage(named: "startButton.png")
        let startButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        startButtonImageView.image = startButtonImage
        startStopButtonImage.addSubview(startButtonImageView)
    }
    
    func setBackgroundColor() {
        if takeABreak {
            // Set break background color
            let backgroundRed: CGFloat = 200 / 255
            let backgroundGreen: CGFloat = 247 / 255
            let backgroundBlue: CGFloat = 197 / 255
            self.view.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)
        } else {
            // Set pomodoro background color
            let backgroundRed: CGFloat = 246 / 255
            let backgroundGreen: CGFloat = 71 / 255
            let backgroundBlue: CGFloat = 71 / 255
            self.view.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)
        }
    }
}

