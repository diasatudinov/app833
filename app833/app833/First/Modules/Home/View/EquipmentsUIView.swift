//
//  EquipmentsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 02.09.2024.
//

import SwiftUI

struct EquipmentsUIView: View {
    @ObservedObject var homeVM: HomeViewModel
    @State var selectedBtn: Btn = .all
    let cellColors: [Color] = [.blueCell, .purpleCell, .pinkCell]
    @State var newEquipmentSheetShow = false
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Text("All")
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedBtn == .all ? Color.main : Color.gray, lineWidth: 1)
                        )
                        .onTapGesture {
                            selectedBtn = .all
                        }
                    
                    Text("Used")
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedBtn == .used ? Color.main : Color.gray, lineWidth: 1)
                        )
                        .onTapGesture {
                            selectedBtn = .used
                        }
                    
                    Text("Replace")
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedBtn == .replace ? Color.main : Color.gray, lineWidth: 1)
                        )
                        .onTapGesture {
                            selectedBtn = .replace
                        }
                    
                    Spacer()
                    
                    Button {
                        newEquipmentSheetShow = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 34, height: 34)
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                        }
                    }
                    
                    
                }
                
                ScrollView {
                    ForEach(homeVM.equipments.indices, id: \.self) { index in
                        EquipmentCellUIView(homeVM: homeVM, equipment: homeVM.equipments[index])
                            .background(cellColors[index % cellColors.count])
                            .cornerRadius(20)

                    }
                }
                Spacer()
            }.padding(.horizontal)
            
        }.navigationTitle(Text("Your equipment"))
            .sheet(isPresented: $newEquipmentSheetShow) {
                NewEquipmentUIView(viewModel: homeVM, newEquipmentSheetShow: $newEquipmentSheetShow)
            }
    }
}

#Preview {
    EquipmentsUIView(homeVM: HomeViewModel())
}
