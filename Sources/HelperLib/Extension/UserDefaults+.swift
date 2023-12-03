//
//  UserDefaults+.swift
//  HelperLib
//
//  Created by Edson Rottava on 08/12/20.
//  Copyright © 2020 Rattova's Dev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public enum Keys {
        static let guid = "kGuid"
        static let intro = "kIntro"
        static let reset = "kReset"
    }
    
    var guid: String {
        get { return string(forKey: Keys.guid) ?? "" }
        set {
            set(newValue, forKey: Keys.guid)
            _ = synchronize()
        }
    }
    
    var intro: Bool {
        get { return bool(forKey: Keys.intro) }
        set {
            set(newValue, forKey: Keys.intro)
            _ = synchronize()
        }
    }
    
    var reset: Bool {
        get { return bool(forKey: Keys.reset) }
        set {
            set(newValue, forKey: Keys.reset)
            _ = synchronize()
        }
    }
    
}
