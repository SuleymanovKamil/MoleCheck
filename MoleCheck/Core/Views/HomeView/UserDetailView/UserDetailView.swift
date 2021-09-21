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
                    .resizable()
                    .frame(width:57.55, height: 71)
                    .scaledToFit()
                    .padding(.leading, 30)
                
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
            .frame(width: screen.width - 30, height: 114)
            .padding(.vertical)
            .background(Color.colors.background.cornerRadius(18)
            .shadow(color: Color.colors.black.opacity(0.1), radius: 5))
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: someUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


