//
//  Constants.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

let safeArea = UIApplication.shared.windows.first?.safeAreaInsets
let screen = UIScreen.main.bounds

var testDate: String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yy"
    
    return "\(dateFormatter.string(from: today))"
}
