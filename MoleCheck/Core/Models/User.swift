//
//  User.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import Foundation

enum status: String, Codable {
    case good, doubtfully, danger
}

struct User: Codable {
    let name: String
    let age: String
    let result: [moleStatus]
   
    struct moleStatus: Codable, Hashable  {
        let status: status
        let checkCount: Int
    }
}

let someUser: User = User(name: "Иван", age: "32",
                          result: [
                            User.moleStatus(status: .good, checkCount: 34),
                            User.moleStatus(status: .doubtfully, checkCount: 5),
                            User.moleStatus(status: .danger, checkCount: 0)
])
