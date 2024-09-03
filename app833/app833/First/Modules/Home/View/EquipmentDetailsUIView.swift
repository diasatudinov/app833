//
//  EquipmentDetailsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 02.09.2024.
//

import SwiftUI

struct EquipmentDetailsUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var equipment: Equipment
    @State var isEditing: Bool = false
    @State var showCards: Bool = true
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            if showCards {
                VStack {
                    
                    if let image = equipment.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 358 ,height: 206)
                            .scaledToFill()
                            .cornerRadius(20)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(width: 358 ,height: 206)
                                .foregroundColor(.gray)
                                .cornerRadius(20)
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                                .foregroundColor(.white)
                        }
                    }
                    
                    ZStack {
                        Color.main
                        
                        VStack {
                            HStack {
                                Text("Сharacteristics")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Spacer()
                            }
                            
                            HStack {
                                VStack {
                                    Text("Material")
                                        .font(.system(size: 15, weight: .bold))
                                    
                                    Text(equipment.material)
                                        .font(.system(size: 15))
                                    
                                }
                                Spacer()
                                VStack {
                                    Text("Weight")
                                        .font(.system(size: 15, weight: .bold))
                                    
                                    Text(equipment.weight)
                                        .font(.system(size: 15))
                                    
                                }
                                Spacer()
                                VStack {
                                    Text("Length")
                                        .font(.system(size: 15, weight: .bold))
                                    
                                    Text(equipment.length)
                                        .font(.system(size: 15))
                                    
                                }
                            }
                        }.padding(.horizontal).foregroundColor(.white)
                        
                    }.frame(height: 120).cornerRadius(20)
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            isEditing = true
                        } label: {
                            
                            
                            Text("Edit")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(Color.detailsBtn)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.detailsBtn, lineWidth: 2)
                                )
                        }
                        
                        Button {
                            viewModel.deleteEquipment(for: equipment)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Delete")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(12)
                                .frame(maxWidth: .infinity)
                            //.padding(.horizontal, 53)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            
                        }
                    }
                    
                }.padding(.horizontal)
                    .onAppear {
                        DispatchQueue.main.async {
                            showCards = true
                        }
                    }
                    .onDisappear {
                        DispatchQueue.main.async {
                            showCards = false
                        }
                    }
            }
                
        }.navigationTitle(Text(equipment.name))
            .sheet(isPresented: $isEditing) {
                EditEquipmentUIView(viewModel: viewModel, equipment: equipment, newEquipmentSheetShow: $isEditing)
            }
            
    }
}

#Preview {
    EquipmentDetailsUIView(viewModel: HomeViewModel(), equipment: Equipment(name: "TaylorMade Driver", material: "Graphite", weight: "300 g", length: "45 inches"))
}


struct EditEquipmentUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State var name: String = ""
    @State var material: String = ""
    @State var weight: String = ""
    @State var length: String = ""
    @State var equipment: Equipment
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
                                viewModel.editEquipment(for: equipment)
                            } else {
                                let equipment = Equipment(name: name, material: material, weight: weight, length: length)
                                viewModel.editEquipment(for: equipment)
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
                .onAppear {
                    selectedImage = equipment.image
                    name = equipment.name
                    material = equipment.material
                    weight = equipment.weight
                    length = equipment.length
                }
            
            
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
