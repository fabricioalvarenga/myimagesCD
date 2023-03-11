//
//  UIImageTransformer.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 11/03/23.
//

import UIKit

class UIImageTransformer: ValueTransformer {
    static let name = NSValueTransformerName("UIImageTransformer")
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        } catch {
            return nil
        }
    }
    
    static func register() {
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: name)
    }
}
