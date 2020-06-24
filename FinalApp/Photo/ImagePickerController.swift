//
//  ImagePickerController.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/17.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI


struct ImagePickerController: UIViewControllerRepresentable{
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: Image
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePickerController: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{   // 代理人須遵從protocal
        internal init(imagePickerController: ImagePickerController) {
            self.imagePickerController = imagePickerController
        }
        let imagePickerController: ImagePickerController
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){ //[UIImagePickerController.InfoKey : Any] 為字典
            if let uiImage = info[.originalImage] as? UIImage {
                imagePickerController.selectImage = Image(uiImage: uiImage)
            }
 //            imagePickerController.selectImage = info[.originalImage] as? UIImage
             imagePickerController.showSelectPhoto = false
        }
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    

}

