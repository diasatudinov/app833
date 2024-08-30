//
//  HomeUIView.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import SwiftUI

enum Btn {
    case all, used, replace
}

struct HomeUIView: View {
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var viewModel: GameViewModel
    @State var selectedBtn: Btn = .all
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack{
                        Image("ava")
                    
                    VStack(spacing: 0) {
                        HStack {
                            
                            Text("Robert")
                            Spacer()
                        }
                            .font(.system(size: 11, weight: .semibold))
                        HStack {
                            Text("Kick statistics")
                                .font(.system(size: 11))
                            Spacer()
                        }
                    }
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 60, height: 30)
                            .cornerRadius(10)
                            .foregroundColor(.main)
                        HStack {
                            Text("\(viewModel.hitsAllTotal())")
                                .foregroundColor(.white)
                            Image("hits")
                        }
                    }
                }.padding(.bottom, 20)
                
                ZStack {
                    Color.main
                    
                    VStack {
                        HStack {
                            Text("14 days of training")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                            
                           
                            
                            Spacer()
                        }.padding()
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.games, id: \.id) { game in
                                    HomeCellUIView(hits: viewModel.hitsTotal(for: game))
                                }
                                
                            }
                        }.frame(height: 100)
                        
                        Button {
                            selectedTab = 1
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 38)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                Text("Go to round")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding()
                                
                                
                                
                            }
                        }
                        Spacer()
                    }
                    
                }.frame(height: 225).cornerRadius(20).padding(.bottom, 20)
                
                HStack {
                    Text("Your equipment")
                        .font(.system(size: 28))
                    Spacer()
                    NavigationLink {
                        Text("AAAA")
                    } label : {
                        Text("All equipment")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.detailsBtn)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                    }
                }.padding(.bottom, 10)
                
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
                }
                
                if !homeVM.equipments.isEmpty {
                    HStack {
                        Text("You don't have the equipment, add it")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black.opacity(0.3))
                        Spacer()
                    }.padding(.top, 20)
                } else {
                    VStack {
                        
                        
                        EquipmentCellUIView().background(Color.blue).cornerRadius(20)
                        EquipmentCellUIView().background(Color.blue).cornerRadius(20).overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 4)
                        ).padding(.top, -100)
                        EquipmentCellUIView().background(Color.blue).cornerRadius(20).overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 4)
                        ).padding(.top, -100)
                            
                        
                        
                        
                        
                    }.padding(.top, 10)
                }
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    HomeUIView(homeVM: HomeViewModel(), viewModel: GameViewModel(), selectedTab: .constant(0))
}

struct HomeCellUIView: View {
    @State var hits: String
    var body: some View {
        ZStack {
            Color.white.opacity(0.1)
            VStack {
                Image("hits")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27)
                Text("\(hits)")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
        }.frame(width: 80, height: 100).cornerRadius(10)
    }
}
