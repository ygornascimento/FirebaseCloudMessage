//
//  AppDelegate.swift
//  Firebase
//
//  Created by Ygor Nascimento on 25/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications

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

        //Firebase initialization
        FirebaseApp.configure()

        //Firebase Cloud Message Delegate
        Messaging.messaging().delegate = self

        //iOS UserNotifications Delegate
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    //Mark: - Local Deeplinks
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url)

        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let host = urlComponents?.host ?? "No Host Available"

        print(host)

        switch host {
            case "home":
                window?.rootViewController = homeViewController
            case "balance":
                window?.rootViewController = balanceViewController
            case "payment":
                window?.rootViewController = paymentViewController
            default:
                window?.rootViewController = homeViewController
        }

        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }

    func permissionAndRegistrationPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .alert]) { granted, _ in
            guard granted else { return }

            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}

extension AppDelegate: MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("...................Firebase registration token: \(fcmToken)")

        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        let notificationInfo: NSDictionary = userInfo as NSDictionary

        //Mark: - Push Notification Deeplinks
        if let url = URL(string: notificationInfo.value(forKey: "link_url") as? String ?? "fire://home") {
            switch url {
                case URL(string: "fire://home"):
                    window?.rootViewController = homeViewController
                case URL(string: "fire://balance"):
                    window?.rootViewController?.present(balanceViewController, animated: true, completion: nil)
                case URL(string: "fire://payment"):
                    window?.rootViewController?.present(paymentViewController, animated: true, completion: nil)
                default:
                    window?.rootViewController = homeViewController
            }
        }

        completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
