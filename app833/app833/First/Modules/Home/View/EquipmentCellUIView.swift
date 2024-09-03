//
//  EquipmentCellUIView.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import SwiftUI

struct EquipmentCellUIView: View {
    @ObservedObject var homeVM: HomeViewModel
    @State var equipment: Equipment
    var body: some View {
        ZStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(equipment.name)
                        .font(.system(size: 17, weight: .semibold))
                    Text("Сharacteristics")
                        .font(.system(size: 15, weight: .semibold))
                    VStack {
                        HStack {
                            Circle()
                                .frame(width: 3, height: 3)
                            Text(equipment.material)
                                .font(.system(size: 12))
                            Spacer()
                        }
                        
                        HStack {
                            Circle()
                                .frame(width: 3, height: 3)
                            Text(equipment.weight)
                                .font(.system(size: 12))
                            Spacer()
                        }
                    }.padding(.horizontal)
                    
                    NavigationLink {
                        EquipmentDetailsUIView(viewModel: homeVM, equipment: equipment)
                            
                    } label: {
                        Text("More details")
                            .foregroundColor(.black)
                            .padding(5)
                            .padding(.horizontal, 35)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                        
                }
                Spacer()
                if let image = equipment.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 115 ,height: 147)
                        .scaledToFill()
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .frame(width: 115 ,height: 147)
                        .foregroundColor(.clear)
                }
                    
                
            }.padding(.horizontal, 12)
                
            
        }.frame(height: 170)
    }
}

#Preview {
    EquipmentCellUIView(homeVM: HomeViewModel(), equipment: Equipment(name: "", material: "", weight: "", length: ""))
}
