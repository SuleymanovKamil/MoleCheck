//
//  UserDetailView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: User
    
    var body: some View {
            HStack {
                Image("AppleWatchImage")
                    .frame(width:57.55, height: 71)
                    .padding(.leading, 20)
                
                VStack (alignment: .leading, spacing: 10){
                    Text(user.name)
                        .font(.system(size: 16))
                        .bold()
                    
                    Text(user.age + " года")
                        .font(.system(size: 13))
                        .foregroundColor(.colors.gray)
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                
                MoleStatus(user: user)
            }
            .rectangleFrame()
            .padding(.vertical)
            .mainBackground()
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: someUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


