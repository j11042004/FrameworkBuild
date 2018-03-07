//
//  ViewController.swift
//  SwiftFrameworkShow
//
//  Created by Uran on 2018/3/7.
//  Copyright © 2018年 Uran. All rights reserved.
//

import UIKit
import SwiftFramework
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        SwiftFramework.shared.hello()
        let swiftHello = SwiftHello.shared.sayHello()
        NSLog("Swift Hello : \(swiftHello)")
    }

}

