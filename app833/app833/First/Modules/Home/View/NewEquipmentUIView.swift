//
//  NewEquipmentUIView.swift
//  app833
//
//  Created by Dias Atudinov on 02.09.2024.
//

import SwiftUI

struct NewEquipmentUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State var name: String = ""
    @State var material: String = ""
    @State var weight: String = ""
    @State var length: String = ""
    @Binding var newEquipmentSheetShow: Bool

    var body: some View {
        ZStack {
            Color.sheet.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(2)
                    .opacity(0.3)
                    .padding()
                
                Text("New equipment")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.bottom, 11)
                
                ZStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300,height: 150)
                            .clipShape(Rectangle())
                            .cornerRadius(20)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundColor(.clear)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .inset(by: 1)
                                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                                    
                                )
                            VStack(spacing: 12) {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70)
                                    .foregroundColor(Color.main)
                            }
                        }
                    }
                }.padding(.bottom)
                    .onTapGesture {
                        isShowingImagePicker = true
                    }
                
                HStack {
                    Text("Name")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("Name", text: $name)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                
                
                
                HStack {
                    Text("Material")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("Graphite", text: $material)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Weight")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("300 g", text: $weight)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Length")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("45 inches", text: $length)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                
                
                HStack {
                    
                    
                    Button {
                        newEquipmentSheetShow = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.detailsBtn)
                            .padding()
                            .padding(.horizontal, 28)
                            .background(Color.sheet)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    Spacer()
                    Button {
                        if !name.isEmpty && !material.isEmpty && !weight.isEmpty && !length.isEmpty {

                            if let image = selectedImage {
                                let equipment = Equipment(imageData: image.jpegData(compressionQuality: 1.0), name: name, material: material, weight: weight, length: length)
                                viewModel.addEquipment(equipment)
                            } else {
                                let equipment = Equipment(name: name, material: material, weight: weight, length: length)
                                viewModel.addEquipment(equipment)
                            }
                            newEquipmentSheetShow = false
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .padding(.horizontal, 36)
                            .background(Color.detailsBtn)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .opacity(!name.isEmpty && !material.isEmpty && !weight.isEmpty && !length.isEmpty ? 1 : 0.5)
                            .padding(.bottom)
                    }
                    
                }
                Spacer()
            }.padding(.horizontal,45)
            
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
    }
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
        
}

#Preview {
    NewEquipmentUIView(viewModel: HomeViewModel(), newEquipmentSheetShow: .constant(true))
}
