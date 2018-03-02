//
//  XibViewController.swift
//  SwiftXiB
//
//  Created by Uran on 2018/2/12.
//  Copyright © 2018年 Uran. All rights reserved.
//

import UIKit

class XibViewController: UIViewController {
    var helloView : HelloView!
    @IBOutlet weak var showView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        helloView = HelloView(frame: CGRect(x: 0, y: 0, width: showView.frame.size.width, height: showView.frame.size.height))
        
        showView.addSubview(helloView)
    }
    override func viewWillLayoutSubviews() {
         helloView.frame = CGRect(x: 0, y: 0, width: showView.frame.width, height: showView.frame.height)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
