//
//  MyImagesCDApp.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import SwiftUI

@main
struct AppEntry: App {
    var body: some Scene {
        WindowGroup {
            MyImagesGridView()
                .environment(\.managedObjectContext, MyImagesContainer().persistentContainer.viewContext)
        }
    }
}
