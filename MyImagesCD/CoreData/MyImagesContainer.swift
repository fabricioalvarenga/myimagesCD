//
//  MyImagesContainer.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import Foundation
import CoreData

class MyImagesContainer {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MyImagesDataModel")
        
        guard let path = persistentContainer.persistentStoreDescriptions.first?.url?.path() else {
            fatalError("Could not find persistent container")
        }
        
        print("Core data", path)
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}
