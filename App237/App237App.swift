//
//  App237App.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsGetStarted()
        
        Apphud.start(apiKey: "app_jDdiaHX7TiDJkEpiRqpHzAiAAZMbwZ")
        Amplitude.instance().initializeApiKey("08b1dab555c562e8898b9f9482261d51")
        OneSignal.initialize("c021f7f6-5640-4b21-a9c5-62066718228b", withLaunchOptions: launchOptions)
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())

        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    var url = "https://onesignal-ba.com/api/os/Ktl5EXeULiQfCX8nsfJX/"
    
    url += Apphud.userID()
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App237App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
