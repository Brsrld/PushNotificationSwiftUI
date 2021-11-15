//
//  LocalNotificationDemoView.swift
//  PushNotification
//
//  Created by Barış Şaraldı on 11.11.2021.
//

import SwiftUI

struct LocalNotificationDemoView: View {
    @StateObject var localNotification = LocalNotification()
    @ObservedObject var notificationCenter: NotificationCenter
    var body: some View {
        VStack {
            Button("schedule Notification") {
                localNotification.setLocalNotification(title: "title",
                                                       subtitle: "Subtitle",
                                                       body: "this is body",
                                                       when: 10)
            }
            
            if let dumbData = notificationCenter.dumbData  {
                Text("Old Notification Payload:")
                Text(dumbData.actionIdentifier)
                Text(dumbData.notification.request.content.body)
                Text(dumbData.notification.request.content.title)
                Text(dumbData.notification.request.content.subtitle)
            }
        }
    }
}


extension UIApplicationDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Successfully registered for notifications!")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to regiser for notifications: \(error.localizedDescription)")
    }
}


struct LocalNotificationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        let not = NotificationCenter()
        LocalNotificationDemoView(notificationCenter: not)
    }
}

