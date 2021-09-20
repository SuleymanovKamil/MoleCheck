//
//  MoleStatus.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct MoleStatus: View {
    let user: User
    
    var body: some View {
        VStack (spacing: 5){
            Spacer()
            ForEach(user.result, id: \.self) { result in
                HStack(spacing: 10){
                    Spacer(minLength: 1)
                    Text(title(for: result))
                        .font(.system(size: 13))
                        .foregroundColor(Color("Gray"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    
                    Circle()
                        .fill(Color(circleColor(for: result)))
                        .frame(width: 24, height: 24)
                    
                    Text("\(result.checkCount)")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(Color("Primary"))
                        .frame(width: 30)
                }
            }
        }
        .padding(.trailing)
    }
}

struct MoleStatus_Previews: PreviewProvider {
    static var previews: some View {
        MoleStatus(user: someUser)
    }
}

extension MoleStatus {
    private func title (for mole: User.moleStatus) -> String {
        switch mole.status {
        case .good: return "Хорошо"
        case .doubtfully:  return "Сомнительно"
        case .danger:  return "Опасно"
        }
    }
    
    private func circleColor(for mole: User.moleStatus) -> String {
        switch mole.status {
        case .good: return "Primary"
        case .doubtfully:  return "Yellow"
        case .danger:  return "Pink"
        }
    }
}
