//
//  TabBarView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

let tabBarIcons = ["HomeIcon", "UserIcon", "PlusButtonIcon","ClipboardIcon","SetttingsIcon"]

struct TabBarView: View {
    @State private var currentTab: String = "HomeIcon"

    init() { UITabBar.appearance().isHidden = true }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                TabView(selection: $currentTab){
                    
                    HomeView()
                        .tag(tabBarIcons[0])
                        .edgesIgnoringSafeArea(.top)
                        .navigationBarHidden(true)
                        .background(Color.colors.background.ignoresSafeArea())
                    
                    Text("AccountView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[1])
                        .background(Color.colors.background.ignoresSafeArea())
                   
                    Text("ClipboardView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[3])
                        .background(Color.colors.background.ignoresSafeArea())
                    
                    Text("SettingsView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[4])
                        .background(Color.colors.background.ignoresSafeArea())
                }
                
                HStack(spacing: 35){
                    ForEach(tabBarIcons,id: \.self) { tab in
                        TabIcon(tabIconImageName: tab, selectedTab: $currentTab)
                    }
                }
                .frame(width: screen.width - 30, height: 60)
                .padding()
                .background(Color.colors.background
                                .clipShape(CornersShape(corners: [.topLeft, .topRight]))
                                .shadow(color: Color.colors.black.opacity(0.1), radius: 5, x: 0, y: -5))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(Store())
    }
}






