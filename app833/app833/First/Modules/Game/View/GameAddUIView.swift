//
//  GameAddUIView.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import SwiftUI

struct GameAddUIView: View {
    @ObservedObject var viewModel: GameViewModel
    @State var hole: String = ""
    @State var par: String = ""
    @State var stroke: String = ""
    @State var game: Game = Game(data: "", stats: [])
    @Binding var openNewGameSheet: Bool
    var body: some View {
        ZStack {
            Color.sheet.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(2)
                    .opacity(0.3)
                    .padding()
                
                Text("\(formattedDate)")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.bottom, 11)
                    .onAppear {
                        game.data = formattedDate
                    }
                HStack {
                    Text("Hole")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $hole)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Par")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $par)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Strokes")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $stroke)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    
                    
                    Button {
                        if let hole = Int(hole), let par = Int(par), let stroke = Int(stroke) {
                            game.stats.append(Stat(hole: hole, par: par, stroke: stroke))
                            self.hole = ""
                            self.par = ""
                            self.stroke = ""
                        } else {
                            print("Conversion failed")
                        }
                        
                    } label: {
                        Text("Add")
                            .foregroundColor(.detailsBtn)
                            .padding(5)
                            .padding(.horizontal, 35)
                            .background(Color.sheet)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    Spacer()
                }
                
                HStack {
                    
                    
                    Button {
                        openNewGameSheet = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.detailsBtn)
                            .padding()
                            .padding(.horizontal, 28)
                            .background(Color.sheet)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    Spacer()
                    Button {
                        if !game.stats.isEmpty {
                            viewModel.addGame(for: game)
                            openNewGameSheet = false
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .padding(.horizontal, 36)
                            .background(Color.detailsBtn)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    
                }
                Spacer()
            }.padding(.horizontal,45)
            
        }
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: Date())
    }
}

#Preview {
    GameAddUIView(viewModel: GameViewModel(), openNewGameSheet: .constant(true))
}


struct GameEditUIView: View {
    @ObservedObject var viewModel: GameViewModel
    @State var hole: String = ""
    @State var par: String = ""
    @State var stroke: String = ""
    @State var game: Game
    @State var stats: [Stat] = []
    @Binding var openEditGameSheet: Bool
    var body: some View {
        ZStack {
            Color.sheet.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(2)
                    .opacity(0.3)
                    .padding()
                
                Text("\(game.data)")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.bottom, 11)
                    
                HStack {
                    Text("Hole")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $hole)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Par")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $par)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    Text("Strokes")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.bottom)
                
                TextField("", text: $stroke)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.sheet)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.main, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
                    
                    
                    Button {
                        if let hole = Int(hole), let par = Int(par), let stroke = Int(stroke) {
                            stats.append(Stat(hole: hole, par: par, stroke: stroke))
                            self.hole = ""
                            self.par = ""
                            self.stroke = ""
                        } else {
                            print("Conversion failed")
                        }
                        
                    } label: {
                        Text("Add")
                            .foregroundColor(.detailsBtn)
                            .padding(5)
                            .padding(.horizontal, 35)
                            .background(Color.sheet)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    Spacer()
                }
                
                HStack {
                    
                    
                    Button {
                        openEditGameSheet = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.detailsBtn)
                            .padding()
                            .padding(.horizontal, 28)
                            .background(Color.sheet)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    Spacer()
                    Button {
                        if !stats.isEmpty {
                            viewModel.editGame(for: game, stats: stats)
                            openEditGameSheet = false
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .padding(.horizontal, 36)
                            .background(Color.detailsBtn)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.detailsBtn, lineWidth: 1)
                            )
                            .padding(.bottom)
                    }
                    
                }
                Spacer()
            }.padding(.horizontal,45)
            
        }
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: Date())
    }
}
