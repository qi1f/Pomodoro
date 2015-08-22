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
    var remainingSeconds = 25 * 60 {
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
            // Set startButton image
            let stopButtonImage = UIImage(named: "stopButton.png")
            let stopButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            stopButtonImageView.image = stopButtonImage
            startStopButtonImage.addSubview(stopButtonImageView)
        } else {
            // Set stopButton image
            let startButtonImage = UIImage(named: "startButton.png")
            let startButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            startButtonImageView.image = startButtonImage
            startStopButtonImage.addSubview(startButtonImageView)
            // Stop counting
            isCounting = false
            displayTimeLabel.text = "25:00"
            remainingSeconds = 25 * 60
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        let backgroundRed: CGFloat = 246 / 255
        let backgroundGreen: CGFloat = 71 / 255
        let backgroundBlue: CGFloat = 71 / 255
        self.view.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)
        // displayTimeLabel background circle
        let displayTimeLabelImage = UIImage(named: "displayTimeLabel.png")
        let displayTimeLabelImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 260, height: 260))
        displayTimeLabelImageView.image = displayTimeLabelImage
        displayTimeLabel.addSubview(displayTimeLabelImageView)
        // Set initial displayTimeLabel text
        displayTimeLabel.text = "25:00"
    }
    
    func updateTime() {
        remainingSeconds -= 1
        
        if remainingSeconds <= 0 {
            isCounting = false
            displayTimeLabel.text = "00:00"
            remainingSeconds = 0
            
            let alert = UIAlertView()
            alert.title = "1 Pomodoro Completed!"
            alert.message = "Good Job!"
            alert.addButtonWithTitle("OK")
            alert.show()
            
            performSegueWithIdentifier("toBreakView", sender: nil)
        }
    }

}

