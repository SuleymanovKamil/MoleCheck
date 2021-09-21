//
//  TabButton.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct TabButton: View {
    let tabIconImageName: String
    @Binding var selectedTab : String
    
    @StateObject private var vm = TabButtonViewModel()
   
    var body: some View {
        Image("\(tabIconImageName)")
            .frame(width: tabIconImageName == vm.plusButton ? 64 : 24,
                   height: tabIconImageName == vm.plusButton ? 64 : 24)
            .onTapGesture { iconPressed() }
            .fullScreenCover(isPresented: $vm.showCamera) {
                ImagePickerView(selectedImage: $vm.molePhoto,
                                sourceType: $vm.photoSourceType)}
            .overlay(RoundedRectangle(cornerRadius: 18)
                        .frame(width: 48, height: 48)
                        .foregroundColor(selectedTab == tabIconImageName
                                            && selectedTab != vm.plusButton ?
                                            Color.colors.primary.opacity(0.15) : .clear))
    }
    
    private func iconPressed(){
        tabIconImageName != vm.plusButton ?
            selectedTab = tabIconImageName :
            vm.showCamera.toggle()
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton(tabIconImageName: "HomeIcon", selectedTab: .constant("HomeIcon"))
    }
}

