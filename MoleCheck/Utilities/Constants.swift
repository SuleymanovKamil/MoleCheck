//
//  Constants.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

let safeArea = UIApplication.shared.windows.first?.safeAreaInsets
let screen = UIScreen.main.bounds
let notificationCenter = UNUserNotificationCenter.current()

var testDate: String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yy"
    
    return "\(dateFormatter.string(from: today))"
}

func getPermession() {
    notificationCenter.getNotificationSettings { (settings) in
        if(settings.authorizationStatus == .authorized) {
            print("Push notification is enabled")
        } else {
            notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Push notification set")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}


