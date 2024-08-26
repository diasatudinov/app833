//
//  ContentView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedButton: Int? = 0
    
    let emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    
    var body: some View {
        ZStack {
            
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                // Кнопки
                ZStack {
                    Rectangle()
                        .cornerRadius(30)
                        .frame(width: 190)
                        .foregroundColor(Color.white)
                        .padding(.leading,-30)
                    
                    if let selectedButton = selectedButton {
                        HStack(spacing: 0) {
                            Rectangle()
                                .cornerRadius(30)
                                .foregroundColor(Color.white)
                            Rectangle()
                                .cornerRadius(30)
                                .foregroundColor(Color.blue)
                            
                        }.frame(width: 146).padding(.leading, 14)
                    } else {
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width: 190)
                            .foregroundColor(Color.white)
                            .padding(.leading,-30)
                        
                    }
                    
                    VStack(spacing: 0) {
                        ForEach(0..<5) { index in
                            ZStack {
                                if selectedButton == index {
                                    if selectedButton == 0 {
                                        Rectangle()
                                            .frame(width: 154)
                                            .foregroundColor(Color.blue)
                                            .cornerRadius(30, corners: [.bottomLeft])
                                    } else if selectedButton == 4 {
                                        Rectangle()
                                            .frame(width: 154)
                                            .foregroundColor(Color.blue)
                                            .cornerRadius(30, corners: [.topLeft])
                                    } else {
                                        Rectangle()
                                            .frame(width: 154)
                                            .foregroundColor(Color.blue)
                                            .cornerRadius(30)
                                    }
                                    
                                } else {
                                    Rectangle()
                                        .frame(width: 154)
                                        .foregroundColor(Color.white)
                                    
                                }
                                Rectangle()
                                    .frame(width: 154)
                                    .foregroundColor(self.selectedButton == index ? Color.blue : Color.white)
                                    .cornerRadius(30)
                                
                                Text("Button \(index + 1)")
                                    .frame(width: 144)
                                    .foregroundColor(self.selectedButton == index ? Color.white : Color.black)
                                    .cornerRadius(8)
                                    .padding(.vertical, 10)
                                
                            }.onTapGesture {
                                withAnimation {
                                    self.selectedButton = index
                                }
                                
                            }
                            
                            
                        }
                    }.padding(.leading,7)
                }.cornerRadius(30, corners: [.bottomRight, .topRight])
                    .padding(.top, 25)
                    .padding(.bottom, 105)
                
                
                Spacer()
                
                if let selectedButton = selectedButton {
                    VStack {
                        
                        Image("image5On")
                            .padding(.trailing, -15)
                        
                    }
                    .transition(.opacity) // Переход для анимации появления
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
