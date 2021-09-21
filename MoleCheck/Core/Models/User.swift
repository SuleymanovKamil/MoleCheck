//
//  User.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import Foundation

struct User: Codable {
    let name: String
    let age: String
    let result: [MoleTestsResult]  
}

let someUser: User = User(name: "Иван", age: "32",
                          result: [
                            MoleTestsResult(moleDescription: "Родимое пятно #2", moleImage: nil, status: .good, testDate: testDate),
                            MoleTestsResult(moleDescription: "Родимое пятно #1", moleImage: nil, status: .doubtfully, testDate: testDate),
                            MoleTestsResult(moleDescription: "Родимое пятно #3", moleImage: nil, status: .good, testDate: testDate)
                          ])
