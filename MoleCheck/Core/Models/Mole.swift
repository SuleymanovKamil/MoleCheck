//
//  MoleTestsResult.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct Mole: Codable, Hashable, Identifiable {
    var id = UUID()
    var moleDescription: String?
    var moleImage: Data?
    let testResult: status
    var testDate: String?
  
    init(moleDescription: String?, moleImage: UIImage?, testResult: status, testDate: String?) {
        self.moleDescription = moleDescription
        self.moleImage = moleImage?.pngData()
        self.testResult = testResult
        self.testDate = testDate
    }
}

let someMole = Mole(moleDescription: "Родимое пятно", moleImage: nil, testResult: .good, testDate: testDate)

enum status: String, Codable, CaseIterable {
    case good = "Хорошо"
    case doubtfully = "Сомнительно"
    case danger = "Опасно"
    
    var statusColor: Color {
        switch self {
        case .good       : return Color.colors.primary
        case .doubtfully : return Color.colors.yellow
        case .danger     : return Color.colors.pink
        }
    }
}
