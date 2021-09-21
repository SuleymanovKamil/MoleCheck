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
    private var cancellable = Set<AnyCancellable>()
    let tabButtonVM = TabButtonViewModel()
    
    init(){
        addMole()
    }
    
    func addMole(){
        tabButtonVM.$molePhoto
            .sink { [weak self] image in
                if image != nil {
                self?.user.result.append(MoleTestsResult(moleDescription: "Родимое пятно", moleImage: image, status: .good, testDate: testDate))
                }
                self?.sendNotification()
            }
            .store(in: &cancellable)
    }
    
    private func sendNotification() {
        getPermession()
        let content = UNMutableNotificationContent()
        content.title = "Фотография сохранена!"
        content.subtitle = "Посмотрите результат"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4 , repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        notificationCenter.add(request)
    }
    
}
