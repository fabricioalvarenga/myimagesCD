//
//  EmailForm.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 11/03/23.
//

import Foundation

struct EmailForm {
    var toAddress = ""
    var subject = ""
    var messageHeader = ""
    var data: Data?
    var fileName = ""
    var mimeType = "text/plain"
    var body: String {
        messageHeader.isEmpty ? "" : messageHeader + "\n"
    }
}
