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
    @State private var showCamera: Bool = false
    @State private var molePhoto: UIImage?
    @State private var photoSourceType: UIImagePickerController.SourceType = .photoLibrary // сменить на .camera для теста на реальном устройстве
    let plusButton: String = "PlusButtonIcon"
    
    var body: some View {
        Image("\(tabIconImageName)")
            .frame(width: tabIconImageName == plusButton ? 64 : 24,
                   height: tabIconImageName == plusButton ? 64 : 24)
            .overlay(RoundedRectangle(cornerRadius: 18)
                        .frame(width: 48, height: 48)
                        .foregroundColor(selectedTab == tabIconImageName
                                            && selectedTab != plusButton ?
                                            Color.colors.primary.opacity(0.15) : .clear))
            .onTapGesture { iconPressed() }
            .fullScreenCover(isPresented: $showCamera) {
                ImagePickerView(selectedImage: $molePhoto, sourceType: $photoSourceType)
            }
    }
    
    private func iconPressed(){
        tabIconImageName != plusButton ?
            selectedTab = tabIconImageName :
            showCamera.toggle()
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton(tabIconImageName: "HomeIcon", selectedTab: .constant("HomeIcon"))
    }
}
