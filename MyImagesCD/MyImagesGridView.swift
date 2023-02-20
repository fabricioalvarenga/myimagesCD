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
    @State private var formType: FormType?
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack {
            Group {
                if !myImages.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(myImages) { myImage in
                                Button {
                                    formType = .update(myImage)
                                } label: {
                                    VStack {
                                        Image(uiImage: myImage.uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                            .shadow(radius: 5)
                                        
                                        Text(myImage.nameView)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
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
            .onChange(of: imagePicker.uiImage) { newImage in
                if let newImage {
                    formType = .new(newImage)
                }
            }
            .sheet(item: $formType) { formType in
                formType // return the formType's body var
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyImagesGridView()
    }
}
