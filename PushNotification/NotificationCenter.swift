//
//  NotificationCenter.swift
//  PushNotification
//
//  Created by Barış Şaraldı on 11.11.2021.
//

import SwiftUI

class NotificationCenter: NSObject, ObservableObject {
    var dumbData: UNNotificationResponse?
    override init() {
       super.init()
       UNUserNotificationCenter.current().delegate = self
    }
}

extension NotificationCenter: UNUserNotificationCenterDelegate  {
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .sound, .badge])
}
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
   dumbData = response
   completionHandler()
}
  func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}
