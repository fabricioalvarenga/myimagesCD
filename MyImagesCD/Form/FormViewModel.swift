//
//  FormViewModel.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import UIKit

class FormViewModel: ObservableObject {
    @Published var name = ""
    @Published var uiImage: UIImage
    
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var incomplete: Bool {
        name.isEmpty || uiImage == UIImage(systemName: "photo")!
    }
    
   init(_ uiImage: UIImage) {
        self.uiImage = uiImage
    }
    
    init(_ myImage: MyImage) {
        name = myImage.nameView
        id = myImage.imageID
        uiImage = myImage.uiImage
    }
}
