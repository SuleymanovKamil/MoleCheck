//
//  User.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import Foundation
import SwiftUI

struct User: Codable {
    let name: String
    let age: String
    var result: [Mole]
}

let someUser: User = User(name: "Иван",
                          age: "32",
                          result: [
                            Mole(moleDescription: "Родимое пятно", moleImage: nil, testResult: .good, testDate: testDate),
                            Mole(moleDescription: "Родимое пятно", moleImage: nil, testResult: .doubtfully, testDate: testDate),
                          ])


