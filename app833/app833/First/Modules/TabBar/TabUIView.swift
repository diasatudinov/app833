//
//  TabUIView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct TabUIView: View {

    @State var selectedTab = 0
    private let tabs = ["Main", "Game", "ACHIEVEMENT","Settings"]
    
//    @ObservedObject var profileVM = ProfileViewModel()
//    @ObservedObject var tripsVM = TripsViewModel()
    
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                Text("MAIN")
                //StatisticsUIView(viewModel: profileVM)
            case 1:
                Text("GAME")
                //TripsUIView(viewModel: tripsVM)
            case 2:
                AchievementUIView(viewModel: AchievementViewModel())
                //SettingsUIView()
            case 3:
                SettingsUIView()
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 84)
                            .cornerRadius(20)
                            .shadow(radius: 3.7)
                            
                            
                        HStack(spacing: 70) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        Image(systemName: icon(for: index))
                                            .foregroundColor(selectedTab == index ? Color.main : Color.black.opacity(0.05))
                                            .font(.system(size: 22))
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 25)
                    }
                    
                }.ignoresSafeArea()
                .onAppear {
                    //AppMetrica.reportEvent(name: "did_show_main_screen")
                }
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "figure.golf"
        case 2: return "trophy.fill"
        case 3: return "gearshape.fill"
        default: return ""
        }
    }
}


#Preview {
    TabUIView()
}
