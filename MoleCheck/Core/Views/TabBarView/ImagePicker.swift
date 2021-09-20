//
//  TabButton.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//


import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var sourceType: UIImagePickerController.SourceType
    @Environment(\.presentationMode) var isPresented
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePickerView
        
        init(picker: ImagePickerView) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.picker.selectedImage = selectedImage
            self.picker.isPresented.wrappedValue.dismiss()
        }
        
    }
}


