//
//  PushNotificationApp.swift
//  PushNotification
//
//  Created by Barış Şaraldı on 11.11.2021.
//

import SwiftUI

@main
struct PushNotificationApp: App {
    @StateObject var notificationCenter = NotificationCenter()

    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            LocalNotificationDemoView(notificationCenter: notificationCenter)
        }
    }
}
