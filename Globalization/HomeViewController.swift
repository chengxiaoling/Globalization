//
//  HomeViewController.swift
//  Globalization
//
//  Created by kayling on 2018/6/4.
//  Copyright © 2018年 Kayling. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        button.addTarget(self, action: #selector(pushNextVC), for: .touchUpInside)
        button.center = self.view.center
        button.setTitle(XALanguageManager.getString(key: "home"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.changeLanguage), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        
    }
    
    @objc func pushNextVC() {
       self.navigationController?.pushViewController(ChangeLanguageViewController(), animated: true)
    }
    
    //刷新UI
    @objc func changeLanguage() {
        button.setTitle(XALanguageManager.getString(key: "home"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
