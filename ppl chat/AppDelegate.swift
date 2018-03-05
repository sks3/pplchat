//
//  AppDelegate.swift
//  ppl chat
//
//  Created by somi on 2/28/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    Parse.initialize(with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) in
      configuration.applicationId = "pplchat"
      configuration.clientKey = "AJfdS39t84fjl4394pDJA39jrJ342"
      configuration.server = "https://frozen-hamlet-57427.herokuapp.com/parse"
    }))
    
    if PFUser.current() != nil {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let chatViewController = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
      let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 54))
      let navItem = UINavigationItem(title: "Chat")
      let signOut = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
      navItem.leftBarButtonItem = signOut
      navBar.setItems([navItem], animated: false)
      chatViewController.view.addSubview(navBar)
      window?.rootViewController = chatViewController
    }
    return true
  }
  
  @objc func done() {
    PFUser.logOut()
    UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

