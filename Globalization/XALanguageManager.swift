//
//  XALanguageManager.swift
//  Globalization
//
//  Created by kayling on 2018/6/4.
//  Copyright © 2018年 Kayling. All rights reserved.
//

import UIKit

let UserLanguage = "UserLanguage"
let AppleLanguages = "AppleLanguages"

class XALanguageManager: NSObject {
    
    static let shareInstance = XALanguageManager()
    
    let def = UserDefaults.standard
    var bundle : Bundle?
    
    func valueWithKey(key: String!) -> String {
        let bundle = XALanguageManager.shareInstance.bundle
        let str = bundle?.localizedString(forKey: key, value: nil, table: UserLanguage)
        return str!
    }
    
    func initUserLanguage() {
        
        var string:String = def.value(forKey: UserLanguage) as! String? ?? ""
        if string == "" {
            let languages = def.object(forKey: AppleLanguages) as? NSArray
            if languages?.count != 0 {
                let current = languages?.object(at: 0) as? String
                if current != nil {
                    string = current!
                    def.set(current, forKey: UserLanguage)
                    def.synchronize()
                }
            }
        }
        string = string.replacingOccurrences(of: "-CN", with: "")
        string = string.replacingOccurrences(of: "-US", with: "")
        var path = Bundle.main.path(forResource:string , ofType: "lproj")
        if path == nil {
            path = Bundle.main.path(forResource:"en" , ofType: "lproj")
        }
        bundle = Bundle(path: path!)
    
    }
    
    func setLanguage(langeuage:String) {
        
        let path = Bundle.main.path(forResource:langeuage , ofType: "lproj")
        
        bundle = Bundle(path: path!)
        
        def.set(langeuage, forKey: UserLanguage)
        
        def.synchronize()
        
    }
    
    class func getString(key:String) -> String{
        let bundle = XALanguageManager.shareInstance.bundle
        let str = bundle?.localizedString(forKey: key, value: nil, table: nil)
        return str!
    }
}
