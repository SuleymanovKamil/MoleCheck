//
//  TabBarView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

let tabBarIcons = ["HomeIcon", "UserIcon", "PlusButtonIcon","ClipboardIcon","SetttingsIcon"]

struct TabBarView: View {
    @State private var currentTab = "HomeIcon"
    @State private var safeArea = UIApplication.shared.windows.first?.safeAreaInsets

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                TabView(selection: $currentTab){
                    
                    HomeView()
                        .tag(tabBarIcons[0])
                        .edgesIgnoringSafeArea(.top)
                        .background(Color("Background").ignoresSafeArea())
                    
                    Text("AccountView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[1])
                        .background(Color("Background").ignoresSafeArea())
                    
                    Text("Camera")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[2])
                        .background(Color("Background").ignoresSafeArea())
                    
                    Text("ClipboardView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[3])
                        .background(Color("Background").ignoresSafeArea())
                    
                    Text("SettingsView")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(tabBarIcons[4])
                        .background(Color("Background").ignoresSafeArea())
                   
                }
                
                HStack(spacing: 35){
                    ForEach(tabBarIcons,id: \.self){image in
                        TabButton(tabIconImageName: image, selectedTab: $currentTab)
                            .foregroundColor(currentTab == image  ? .black : Color.gray.opacity(0.5))
                    }
                }
                .frame(width: screen.width - 30, height: 60)
                .padding()
                .background(Color("Background")
                                .clipShape(CornersShape(corners: [.topLeft, .topRight]))
                                .shadow(color: Color("Black").opacity(0.1), radius: 5, x: 0, y: -5))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(Store())
    }
}






