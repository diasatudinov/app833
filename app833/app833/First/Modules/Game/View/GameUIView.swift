//
//  GameUIView.swift
//  app833
//
//  Created by Dias Atudinov on 28.08.2024.
//

import SwiftUI

enum Tab {
    case weekly, allTime
}

struct GameUIView: View {
    @State private var selectedTab: Tab = .weekly
    @State private var showSheet = true
    @State private var isSheetPresented = false

    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Game results tracking")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                Picker("Select a tab", selection: $selectedTab) {
                    Text("Weekly").tag(Tab.weekly)
                    Text("All time").tag(Tab.allTime)
                }.padding(.horizontal).frame(height: 41)
                .pickerStyle(SegmentedPickerStyle())
                .onAppear {
                    //UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.gray
                    
                    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                    let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.main]
                    UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
                    UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
                }
                Spacer()
                ZStack {
                    HStack(spacing: 14) {
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor(.white.opacity(0.15))
                                Text("2")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 148)
                        }
                        
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor(.white.opacity(0.15))
                                Text("1")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 240)
                        }
                        
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor(.white.opacity(0.15))
                                Text("3")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 87)
                        }
                    }
                }.frame(height: 284)
                    .padding(.bottom, (UIScreen.main.bounds.height / 2) - 50)
                
            }
            ZStack {
                HalfScreenSheetView(isPresented: $isSheetPresented)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                
            }
        }
//        .sheet(isPresented: $showSheet) {
//            Text("")
//                .presentationDetents([.medium])
//        }
    }
}

#Preview {
    GameUIView()
}

struct HalfScreenSheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("This is a half-screen sheet")
                    .padding()
                
                Button("Dismiss") {
                    isPresented.toggle()
                }
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity)
            .frame(height: isPresented ? UIScreen.main.bounds.height - 90 : UIScreen.main.bounds.height / 2)
            .background(Color.white)
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
