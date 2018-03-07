//
//  HelloView.swift
//  SwiftXiB
//
//  Created by Uran on 2018/2/12.
//  Copyright © 2018年 Uran. All rights reserved.
//

import UIKit

class HelloView: UIView {
    private weak var view : UIView!
    convenience init(){
        self.init(frame: CGRect.zero)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customerInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customerInit()
        // 出錯 還要再修正
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        NSLog("Hello View awake")
    }
    func customerInit(){
        view = self.loadViewfromNib()
        view.backgroundColor = UIColor.green
        self.addSubview(view)
    }
    
    func loadViewfromNib() -> UIView {
        let xibStr = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: xibStr, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.frame
        return view
    }
    
    @IBOutlet weak var releaseButton: UIButton!
    @IBAction func releaseAction(_ sender: UIButton) {
        let vc = self.getTopVC(baseVC: UIApplication.shared.keyWindow?.rootViewController)
        if let navVc = vc?.navigationController {
            navVc.popViewController(animated: true)
        }else{
            vc?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    private func getTopVC(baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?{
        if let navVC = baseVC as? UINavigationController{
            return getTopVC(baseVC:navVC.visibleViewController )
        }
        if let tab = baseVC as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopVC(baseVC: selected)
            }
        }
        if let presented = baseVC?.presentedViewController {
            return getTopVC(baseVC: presented)
        }
        
        return baseVC
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
