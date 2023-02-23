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
    
    let moc = MyImagesContainer().persistentContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            MyImagesGridView()
                .environment(\.managedObjectContext, moc)
                .environmentObject(shareService)
                .onAppear {
                    print("Document Directory", URL.documentsDirectory.path)
                }
                .onOpenURL { url in
                    shareService.restore(url: url)
                }
        }
    }
}
