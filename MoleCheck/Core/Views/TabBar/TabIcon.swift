//
//  TabButton.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct TabIcon: View {
    let tabIconImageTitle: String
    let plusButtonTitle: String = "PlusButtonIcon"
    @Binding var selectedTab: String
    @State private var showCamera: Bool = false
    @EnvironmentObject private var store: Store
   
    var body: some View {
        let tabIconSize: CGFloat = tabIconImageTitle == plusButtonTitle ? 64 : 24
        
        Image("\(tabIconImageTitle)")
            .frame(width: tabIconSize, height: tabIconSize)
            .onTapGesture { iconPressed() }
            .fullScreenCover(isPresented: $showCamera) {
                ImagePickerView(selectedImage: $store.molePhoto).ignoresSafeArea()}
            .overlay(RoundedRectangle(cornerRadius: 18)
                        .frame(width: 48, height: 48)
                        .foregroundColor(selectedTab == tabIconImageTitle
                                            && selectedTab != plusButtonTitle ?
                                            Color.colors.primary.opacity(0.15) : .clear))
    }
    private func iconPressed(){
        tabIconImageTitle != plusButtonTitle ?
            selectedTab = tabIconImageTitle :
            showCamera.toggle()
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabIcon(tabIconImageTitle: "HomeIcon", selectedTab: .constant("HomeIcon"))
    }
}

