//
//  MyImages+Extension.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import UIKit

extension MyImage {
    var nameView: String {
        name ?? ""
    }
    
    var imageID: String {
        id ?? ""
    }
    
    var uiImage: UIImage {
        if !imageID.isEmpty {
            if let image = FileManager().retrieve(with: imageID) {
                return image
            }
        }
        
        return UIImage(systemName: "photo")!
    }
}
