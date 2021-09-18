//
//  AppDelegate.swift
//  flutter_module_import_demo
//
//  Created by 松丸豪志 on 2021/09/15.
//

import UIKit
import Flutter
import FlutterPluginRegistrant


@main
class AppDelegate: FlutterAppDelegate {
    
    var flutterEngine : FlutterEngine?;
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil);
        self.flutterEngine?.run(withEntrypoint: nil);
        GeneratedPluginRegistrant.register(with: self.flutterEngine!);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }
}
