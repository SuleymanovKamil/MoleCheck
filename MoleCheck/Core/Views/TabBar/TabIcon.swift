//
//  TabButton.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct TabIcon: View {
    let tabIconImageName: String
    let plusButton: String = "PlusButtonIcon"
    @State private var showCamera: Bool = false
    @Binding var selectedTab: String
    @EnvironmentObject private var store: Store
   
    var body: some View {
        let tabIconSize: CGFloat = tabIconImageName == plusButton ? 64 : 24
        
        Image("\(tabIconImageName)")
            .frame(width: tabIconSize, height: tabIconSize)
            .onTapGesture { iconPressed() }
            .fullScreenCover(isPresented: $showCamera) {
                ImagePickerView(selectedImage: $store.molePhoto).ignoresSafeArea()}
            .overlay(RoundedRectangle(cornerRadius: 18)
                        .frame(width: 48, height: 48)
                        .foregroundColor(selectedTab == tabIconImageName
                                            && selectedTab != plusButton ?
                                            Color.colors.primary.opacity(0.15) : .clear))
    }
    private func iconPressed(){
        tabIconImageName != plusButton ?
            selectedTab = tabIconImageName :
            showCamera.toggle()
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabIcon(tabIconImageName: "HomeIcon", selectedTab: .constant("HomeIcon"))
    }
}

