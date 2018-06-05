//
//  ChangeLanguageViewController.swift
//  Globalization
//
//  Created by kayling on 2018/6/4.
//  Copyright © 2018年 Kayling. All rights reserved.
//

import UIKit

class ChangeLanguageViewController: UIViewController {

    @IBOutlet weak var ib_norLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ib_norLabel.text = XALanguageManager.getString(key: "word")
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeLanguageViewController.changeLanguage), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
    
    @IBAction func changeChinaLanguage(_ sender: Any) {
        
        XALanguageManager.shareInstance.setLanguage(langeuage: "zh-Hans")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
    
    @IBAction func changeEnglishLanguage(_ sender: Any) {
        
        XALanguageManager.shareInstance.setLanguage(langeuage: "en")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }
    
    @objc func changeLanguage() {
        
        ib_norLabel.text = XALanguageManager.getString(key: "word")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
}
