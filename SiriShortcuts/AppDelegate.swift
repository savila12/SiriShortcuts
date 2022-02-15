//
//  AppDelegate.swift
//  SiriShortcuts
//
//  Created by Javier Azuara on 2/13/22.
//

import Foundation
import UIKit
import Intents

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let intent = AdditionIntentIntent()
        intent.first = 10.0
        intent.second = 5.0
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate(completion: nil)
        
        return true
    }
}
