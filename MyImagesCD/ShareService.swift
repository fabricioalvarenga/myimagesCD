//
//  ShareService.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 21/02/23.
//

import Foundation

struct CodableImage: Codable, Equatable {
    let id: String
    let name: String
    let comment: String
    let dateTaken: Date
    let receivedFrom: String
}

class ShareService: ObservableObject {
    static let ext = "myimg"
    
    func saveMyImage(_ codableImage: CodableImage) {
        let fileName = "\(codableImage.id).\(Self.ext)"
        do {
            let data = try JSONEncoder().encode(codableImage)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveJSON(jsonString, fileName: fileName)
        } catch {
            print("Could not encode data")
        }
    }
}
