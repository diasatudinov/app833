//
//  GameDetailsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 29.08.2024.
//

import SwiftUI

struct GameDetailsUIView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Color.main
                
                VStack {
                    HStack {
                        Text("Hole results")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .padding(.top, 22)
                            .padding(.leading)
                            .padding(.bottom, 20)
                        Spacer()
                    }
                    
                    ZStack {
                        VStack(spacing: 0) {
                            ZStack {
                                Color.white.opacity(0.15)
                                HStack {
                                    Text("Hole")
                                    Spacer()
                                    Text("Par")
                                    Spacer()
                                    Text("Strokes")
                                    
                                }.font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 60)
                                
                            }.frame(height: 30)
                            ZStack {
                                Color.white.opacity(0.5)
                                
                                ScrollView {
                                    VStack {
                                        HStack(spacing: 20) {
                                            
                                            Text("1")
                                            Spacer()
                                            Text("1")
                                            Spacer()
                                            Text("1")
                                            
                                        }.font(.system(size: 13))
                                        .padding(.leading, 25)
                                            .padding(.trailing, 90)
                                            .padding(.top, 10)
                                        
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .opacity(0.2)
                                    }
                                    
                                    
                                    
                                    
                                }
                            }
                        }
                    }.frame(height: 230)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
                    Spacer()
                    
                }
                
            }.frame(height: 314)
                .cornerRadius(20)
            
            HStack(spacing: 10) {
                ZStack {
                    Color.main
                    
                    VStack {
                        
                        Text("76")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                        
                        Text("Vapor quantity")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                        
                    }
                    
                }.frame(height: 174)
                    .cornerRadius(20)
                
                ZStack {
                    Color.main
                    
                    VStack {
                        
                        Text("78")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                        
                        Text("Vapor of beats")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                    }
                    
                }.frame(height: 174)
                    .cornerRadius(20)
            }
            Spacer()
            
            HStack {
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
            
            
        }.padding(.horizontal)
        
    }
}

#Preview {
    GameDetailsUIView()
}



