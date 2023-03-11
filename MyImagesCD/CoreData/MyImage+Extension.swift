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
        image ?? UIImage(systemName: "photo")!
    }
    
    var commentView: String {
        comment ?? ""
    }
    
    var receivedFromView: String {
        receivedFrom ?? ""
    }
}
