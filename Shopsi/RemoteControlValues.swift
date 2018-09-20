//
//  RCValues.swift
//  FirConfig
//
//  Created by Preuttipan Janpen on 20/9/2561 BE.
//  Copyright © 2561 Lphant. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class RemoteControlValues {
    
    static let sharedInstance = RemoteControlValues()
    
    enum ValueKey: String {
        case appPrimaryColor
        case buttonText
    }
    
    private init() {
        loadDefaultValues()
        fetchRemoteConfig()
    }
    
    func loadDefaultValues() {
        
//        let appDefaults: [String: Any?] = [
//            "appPrimaryColor" : "#FBB03B"
//        ]
        
        let appDefaults: [String: Any?] = [
            ValueKey.appPrimaryColor.rawValue : "#FBB03B",
            ValueKey.buttonText.rawValue : "Default Text!!!"
        ]
        
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
    }
    
    func fetchRemoteConfig() {
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) {  ( status, error) in
            guard error == nil else {
                print("Error : \(error as! String)")
                return
            }
            
            print("We get someting from cloud")
            RemoteConfig.remoteConfig().activateFetched()
        }
    }
    
    func string(forKey key: ValueKey) -> String {
        let textString = RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? ""
        
        return textString
    }
    
    func color(forKey key: ValueKey) -> UIColor {
        let colorAsHexString = RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? "#FFFFFF"
        let convertedColor = Color.hexStringToUIColor(hex: colorAsHexString)
        return convertedColor
    }
}
