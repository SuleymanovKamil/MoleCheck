//
//  AddSubscriptionView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct AddSubscriptionView: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                Image("SubcriptionImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 95)
                    .offset(x: -10)
                
                VStack (spacing: 0){
                    Spacer()
                    
                    Text("3 дня премиума бесплатно")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Можно отменить в любой момент")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                    
                    Button(action: {}, label: {
                        Text("Попробовать")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.colors.primary)
                            .padding()
                            .frame(width: geo.size.width - 90)
                            .background(Color.white.cornerRadius(18))
                    })
                    .padding(.top, 3)
                    Spacer()
                }
                .offset(x: -10)
            }
        }
        .frame(width: screen.width - 30, height: 114)
        .background(Color.colors.primary.cornerRadius(18)
                    .shadow(color: Color.colors.black.opacity(0.1), radius: 5))
    }
}

struct AddSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubscriptionView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
