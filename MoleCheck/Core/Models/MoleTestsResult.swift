//
//  MoleTestsResult.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

enum status: String, Codable, CaseIterable {
    case good = "Хорошо"
    case doubtfully =  "Сомнительно"
    case danger =  "Опасно"
    
    var statusColor: Color {
        switch self {
        case .good       : return Color.colors.primary
        case .doubtfully : return Color.colors.yellow
        case .danger     : return Color.colors.pink
        }
    }
}

struct MoleTestsResult: Codable, Hashable {
    var moleDescription: String?
    var moleImage: String?
    let status: status
    var testDate: String?
  
    init(moleDescription: String?, moleImage: String?, status: status, testDate: String?) {
        self.moleDescription = moleDescription
        self.moleImage = moleImage
        self.status = status
        self.testDate = testDate
    }
}





let someMole = MoleTestsResult(moleDescription: "Родимое пятно #2", moleImage: nil, status: .good, testDate: testDate)
