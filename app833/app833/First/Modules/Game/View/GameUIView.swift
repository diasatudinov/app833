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
    @ObservedObject var viewModel: GameViewModel
    @State private var selectedTab: Tab = .weekly
    @State private var showAddSheet = false
    @State private var isSheetPresented = false

    @State private var statisticsAlert = false
    @State private var first: String = ""
    @State private var second: String = ""
    @State private var third: String = ""
    
    
    var body: some View {
        ZStack {
            
            Color.main.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer()
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
                HStack {
                    Spacer()
                    Button {
                        first = ""
                        second = ""
                        third = ""
                        statisticsAlert = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 34, height: 34)
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                        }
                    }
                }.padding(.horizontal)
                ZStack {
                    HStack(spacing: 14) {
                        VStack {
                            Spacer()
                            Text("\(viewModel.graph.second) hit")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor((viewModel.graph.first == "-" || viewModel.graph.second == "-" || viewModel.graph.third == "-") ?  .graphOff : .white.opacity(0.15))
                                Text("2")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 148)
                        }
                        
                        VStack {
                            Spacer()
                            Text("\(viewModel.graph.first) hit")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor((viewModel.graph.first == "-" || viewModel.graph.second == "-" || viewModel.graph.third == "-") ?  .graphOff : .white.opacity(0.15))
                                Text("1")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 240)
                        }
                        
                        VStack {
                            Spacer()
                            Text("\(viewModel.graph.third) hit")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor((viewModel.graph.first == "-" || viewModel.graph.second == "-" || viewModel.graph.third == "-") ?  .graphOff : .white.opacity(0.15))
                                Text("3")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                            }.frame(width: 104, height: 87)
                        }
                    }
                }.frame(height: 274)
                    .padding(.bottom, (UIScreen.main.bounds.height / 2) - 50)
                
            }
            ZStack {
                HalfScreenSheetView(viewModel: viewModel, isPresented: $isSheetPresented, selectedTab: $selectedTab, showAddSheet: $showAddSheet)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                
            }
            
            if statisticsAlert {
                
                Color.black.ignoresSafeArea().opacity(0.6).onTapGesture {
                    statisticsAlert = false
                }
                
                VStack {
                    ZStack {
                        Color.sheet
                        
                        VStack {
                            Text("Enter data for the chart")
                                .font(.system(size: 17, weight: .semibold))
                                .padding(10)
                            TextField("First place", text: $first)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                            
                            TextField("Second place", text: $second)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                            
                            TextField("Third place", text: $third)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .padding(.bottom, 10)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray.opacity(0.3))
                                .padding(.horizontal, -16)
                            Button("Save") {
                                if first != "", second != "", third != "" {
                                    let graph = Graph(first: first, second: second, third: third)
                                    viewModel.saveGraph(for: graph)
                                    statisticsAlert = false
                                }
                            }
                            Spacer()
                        }.padding(.horizontal)
                        
                    }.frame(height: 228)
                        .cornerRadius(14)
                }.padding(.horizontal, 60)
                
            }
        
        }.sheet(isPresented: $showAddSheet) {
            GameAddUIView(viewModel: viewModel, openNewGameSheet: $showAddSheet)
        }
    }
}

#Preview {
    GameUIView(viewModel: GameViewModel())
}

struct HalfScreenSheetView: View {
    @ObservedObject var viewModel: GameViewModel
    @Binding var isPresented: Bool
    @Binding var selectedTab: Tab
    @Binding var showAddSheet: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack {
                    
                    Rectangle()
                        .frame(width: 36, height: 5)
                        .cornerRadius(2)
                        .opacity(0.5)
                        .padding()
                    
                    HStack {
                        Text("Weekly")
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color.sheet)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedTab == .weekly ? Color.main : Color.gray, lineWidth: 1)
                            )
                        Text("All time")
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color.sheet)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedTab == .allTime ? Color.main : Color.gray, lineWidth: 1)
                            )
                        
                        Spacer()
                        
                        Button {
                            showAddSheet = true
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
                    if false {
                        VStack {
                            Image(systemName: "figure.golf")
                                .font(.system(size: 100))
                            
                            Text("You haven't added game data")
                                .font(.system(size: 16, weight: .semibold))
                        }.foregroundColor(.gray)
                        Spacer()
                    } else {
                        ScrollView {
                            ForEach(viewModel.games , id: \.self) { game in
                                GameCellUIView(viewModel: viewModel, game: game)
                                    .padding(.top)
                            }
                        }
                    }
                    
                }.padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: isPresented ? UIScreen.main.bounds.height - 90 : UIScreen.main.bounds.height / 2)
                .background(Color.sheet)
                .cornerRadius(20)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: isPresented ? UIScreen.main.bounds.height - 90 : UIScreen.main.bounds.height / 2)
                    .foregroundColor(.clear)
                    
                    
            }.edgesIgnoringSafeArea(.bottom)
        }.onTapGesture {
            isPresented.toggle()
        }
    }
}
