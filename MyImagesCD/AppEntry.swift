//
//  MyImagesCDApp.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var shareService = ShareService()
    
    var body: some Scene {
        WindowGroup {
            MyImagesGridView()
                .environment(\.managedObjectContext, MyImagesContainer().persistentContainer.viewContext)
                .environmentObject(shareService)
                .onAppear {
                    print("Document Directory", URL.documentsDirectory.path)
                }
        }
    }
}
