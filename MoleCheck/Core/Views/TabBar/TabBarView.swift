//
//  TabBarView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct TabBarView: View {
    @State private var currentTab: String = "HomeIcon"

    init() { UITabBar.appearance().isHidden = true }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                tabBarViews
                tabBarIcons
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

let tabBarTitles = ["HomeIcon",
                    "UserIcon",
                    "PlusButtonIcon",
                    "ClipboardIcon",
                    "SetttingsIcon"]

extension TabBarView{
    var tabBarViews: some View {
        TabView(selection: $currentTab){
            HomeView()
                .tag(tabBarTitles[0])
                .edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
                .background(Color.colors.background.ignoresSafeArea())
            
            Text("AccountView")
                .tag(tabBarTitles[1])
           
            Text("ClipboardView")
                .tag(tabBarTitles[3])
            
            Text("SettingsView")
                .tag(tabBarTitles[4])
        }
    }
    
    var tabBarIcons: some View{
        HStack(spacing: 35){
            ForEach(tabBarTitles,id: \.self) { tab in
                TabIcon(tabIconImageTitle: tab, selectedTab: $currentTab)
            }
        }
        .frame(width: screen.width - 30, height: 60)
        .padding()
        .background(Color.colors.background
                        .clipShape(CornersShape(corners: [.topLeft, .topRight]))
                        .shadow(color: Color.colors.black.opacity(0.1), radius: 5, x: 0, y: -5))
    }
}





