//
//  AppDelegate.swift
//  Runner
//
//  Created by IBEHOKUTO on 2018/12/17.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//
import Flutter
import UIKit

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let testViewFactory = TestViewFactory()
        registrar(forPlugin: "TestView").register(testViewFactory, withId: "TestView")
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

}
