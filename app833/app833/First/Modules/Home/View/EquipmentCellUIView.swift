//
//  EquipmentCellUIView.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import SwiftUI

struct EquipmentCellUIView: View {
    var body: some View {
        ZStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("TaylorMade Driver")
                        .font(.system(size: 17, weight: .semibold))
                    Text("Сharacteristics")
                        .font(.system(size: 15, weight: .semibold))
                    VStack {
                        HStack {
                            Circle()
                                .frame(width: 3, height: 3)
                            Text("Graphite")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        
                        HStack {
                            Circle()
                                .frame(width: 3, height: 3)
                            Text("300 g")
                                .font(.system(size: 12))
                            Spacer()
                        }
                    }.padding(.horizontal)
                    
                    Text("More details")
                        .padding(5)
                        .padding(.horizontal, 35)
                        .background(Color.red)
                        .cornerRadius(10)
                        
                }
                Spacer()
                
                Image("imageCool1")
                    .resizable()
                    .frame(width: 115 ,height: 147)
                    .scaledToFill()
                    
                
            }.padding(.horizontal, 12)
            
        }.frame(height: 170)
    }
}

#Preview {
    EquipmentCellUIView()
}
