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
        VStack (alignment: .leading, spacing: 5){
            ForEach(status.allCases, id: \.self) { status in
                    HStack(spacing: 10){
                        
                        Spacer()
                        
                        Text(status.rawValue)
                            .font(.system(size: 13))
                            .foregroundColor(.colors.gray)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                        
                        Circle()
                            .fill(status.statusColor)
                            .frame(width: 24, height: 24)
                        
                        Text("\(user.result.filter{$0.testResult == status}.count)")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.colors.primary)
                            .frame(width: 30)
                    }
                }
        }
        .padding(.trailing)
        .frame(width: screen.width / 2)
    }
}

struct MoleStatus_Previews: PreviewProvider {
    static var previews: some View {
        MoleStatus(user: someUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

