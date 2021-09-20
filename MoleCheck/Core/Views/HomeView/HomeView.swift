//
//  HomeView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var store: Store
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack (spacing: 30){
                Text("Главная страница")
                .font(.title)
                .bold()
                .foregroundColor(Color("Black"))
                .leadingView()
                .padding(.top, 63)
                    
                UserDetailView(user: store.user)
                
                HStack {
                    Text("Последние события")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("Black"))
                        .leadingView()
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Очистить")
                            .font(.system(size: 13))
                            .foregroundColor(Color("Gray"))
                            .padding(.trailing)
                    })

                    
                }
                
                
                Spacer()
            }
          
               
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Store())
    }
}
