//
//  Store.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI
import Combine

class Store: ObservableObject{
    @Published var user: User = someUser
    @Published var molePhoto: UIImage?
    private var cancellable = Set<AnyCancellable>()
    
    init(){ addSubscription() }
    
    func addSubscription(){
       $molePhoto
            .sink { [weak self] image in
                if image != nil {
                self?.user.result.append(Mole(moleDescription: "Родимое пятно", moleImage: image, testResult: .good, testDate: testDate))
                }
                self?.sendNotification()
            }
            .store(in: &cancellable)
    }
}

extension Store {
    private func getPermessionForNotification() {
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
    
    private func sendNotification() {
        getPermessionForNotification()
        let content = UNMutableNotificationContent()
        content.title = "Фотография сохранена!"
        content.subtitle = "Посмотрите результат"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4 , repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        notificationCenter.add(request)
    }

}
