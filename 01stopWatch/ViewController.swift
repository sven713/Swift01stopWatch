//
//  ViewController.swift
//  01stopWatch
//
//  Created by sven on 16/12/17.
//  Copyright © 2016年 sven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pausBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var Timer = NSTimer() // 定义定时器变量
    var counter = 0.0
    var isRuningTimer = false
    
    @IBAction func playBtnAction(sender: AnyObject) {
        if isRuningTimer {
            return
        }
        // 开启定时器
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(updateCounter), userInfo: nil, repeats: true);
        Timer.fire()
        isRuningTimer = true
    }
    
    @IBAction func pausBtnAction(sender: AnyObject) {
        Timer.invalidate()
        isRuningTimer = false
    }
    
    @IBAction func resetBtnAction(sender: AnyObject) {
        Timer.invalidate()
        isRuningTimer = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    func updateCounter() {
        counter += 0.1;
        timeLabel.text = String(format: "%0.1f",counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter);
    }
}

