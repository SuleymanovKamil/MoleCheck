//
//  MoleCheckApp.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

@main
struct MoleCheckApp: App {
    @StateObject private var store = Store()
    var body: some Scene {
        WindowGroup {
                TabBarView()
                    .environmentObject(store)
                    .preferredColorScheme(.light)
        }
    }
}
