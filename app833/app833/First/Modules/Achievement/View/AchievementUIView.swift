//
//  AchievementUIView.swift
//  app833
//
//  Created by Dias Atudinov on 26.08.2024.
//

import SwiftUI

struct AchievementUIView: View {
    @ObservedObject var viewModel: AchievementViewModel
    @State private var selectedButton: Int? = 0
    
    var body: some View {
        ZStack {
            
            Color.main
                .ignoresSafeArea()
            
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
                                .foregroundColor(Color.main)
                            
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
                                            .foregroundColor(Color.main)
                                            .cornerRadius(30, corners: [.bottomLeft])
                                    } else if selectedButton == 4 {
                                        Rectangle()
                                            .frame(width: 154)
                                            .foregroundColor(Color.main)
                                            .cornerRadius(30, corners: [.topLeft])
                                    } else {
                                        Rectangle()
                                            .frame(width: 154)
                                            .foregroundColor(Color.main)
                                            .cornerRadius(30)
                                    }
                                    
                                } else {
                                    Rectangle()
                                        .frame(width: 154)
                                        .foregroundColor(Color.white)
                                    
                                }
                                Rectangle()
                                    .frame(width: 154)
                                    .foregroundColor(self.selectedButton == index ? Color.main : Color.white)
                                    .cornerRadius(30)
                                
                                Image(viewModel.achievements[index].complite ? viewModel.achievements[index].iconImage + "On" : viewModel.achievements[index].iconImage + "Off")
                                    
                                
                                
                            }.onTapGesture {
                                withAnimation {
                                    self.selectedButton = index
                                }
                                
                            }
                            
                            
                        }
                    }.padding(.leading,7)
                }.cornerRadius(30, corners: [.bottomRight, .topRight])
                    .padding(.top, 70)
                    .padding(.bottom, 80)
                
                
                Spacer()
                
                if let selectedButton = selectedButton {
                    VStack(spacing: 33) {
                        
                        Image(viewModel.achievements[self.selectedButton!].complite ? viewModel.achievements[self.selectedButton!].image + "On" : viewModel.achievements[self.selectedButton!].image + "Off")
                            .padding(.trailing, -15)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.achievements[self.selectedButton!].text)
                                .multilineTextAlignment(.leading)
                                .frame(height: 68)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .padding(2)
                            Text(viewModel.achievements[self.selectedButton!].description)
                                .multilineTextAlignment(.leading)
                                .frame(height: 74)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                        }.padding(.leading, 25)
                        Spacer()
                        
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 195, height: 38)
                                .foregroundColor(.white.opacity(viewModel.achievements[self.selectedButton!].complite ? 0.5 : 1))
                                .cornerRadius(10)
                            Text("Complite")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.black)
                        }.onTapGesture {
                            withAnimation {
                                viewModel.compliteToggle(index: selectedButton)
                            }
                        }
                        
                        
                    }.padding(.top, 100)
                        .padding(.bottom, 80)
                        .transition(.opacity) // Переход для анимации появления
                }
                Spacer()
            }
            VStack {
                Text("Achievement")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
            }.padding(.top)
        }
    }
}

#Preview {
    AchievementUIView(viewModel: AchievementViewModel())
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
