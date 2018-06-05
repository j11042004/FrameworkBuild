//
//  ViewController.swift
//  HelloDelayAndTimer
//
//  Created by Uran on 2018/3/27.
//  Copyright © 2018年 Uran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var timer:Timer?
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "0"
    }

    @IBAction func startAction(_ sender: Any) {
        timeLabel.text = "0"
        NSLog("Hello Timer")
        var times = 0
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](timer) in
            times+=1
            NSLog("Hello times : \(times)")
            self?.timeLabel.text = "\(times)"
            if times == 5{
                self?.timer?.invalidate()
            }
        }

    }
    @IBAction func dispatchDelayAction(_ sender: Any) {
        NSLog("Hello dispatch delay")
        self.count = 1
        self.runRepeatDelay()
    }
    func runRepeatDelay(){
        let delay = DispatchTime.now()+1
        self.count+=1
        DispatchQueue.main.asyncAfter(deadline: delay) {
            NSLog("Hello dispatch delay :\(self.count)")
            if self.count == 5 {
                return
            }
            self.runRepeatDelay()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }

}

