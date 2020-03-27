//
//  AppDelegate.swift
//  FCM
//
//  Created by Ygor Nascimento on 27/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let homeViewController = HomeViewController()
    let balanceViewController = BalanceViewController()
    let paymentViewController = PaymentViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Layout Initialization
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        return true
    }


}

