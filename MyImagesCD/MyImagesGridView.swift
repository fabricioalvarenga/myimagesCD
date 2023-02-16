//
//  ContentView.swift
//  MyImagesCD
//
//  Created by FABRICIO ALVARENGA on 16/02/23.
//

import SwiftUI
import PhotosUI

struct MyImagesGridView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var myImages: FetchedResults<MyImage>
    
    @StateObject private var imagePicker = ImagePicker()
    
    var body: some View {
        NavigationStack {
            Group {
                if !myImages.isEmpty {
                    // display grid of photos
                } else {
                    Text("Select your first image")
                }
            }
            .navigationTitle("My Images")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker("New Image", selection: $imagePicker.imageSelection, matching: .images, photoLibrary: .shared())
                        .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyImagesGridView()
    }
}
