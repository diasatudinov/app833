//
//  GameDetailsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 29.08.2024.
//

import SwiftUI

struct GameDetailsUIView: View {
    @ObservedObject var viewModel: GameViewModel
    @State var game: Game
    @State var openEditGameSheet: Bool = false
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
                                    ForEach(game.stats, id: \.self) { stat in
                                        DetailsStatCell(hole: "\(stat.hole)", par: "\(stat.par)", stroke: "\(stat.stroke)")
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
                        
                        Text("\(viewModel.vaporQuantity(for: game))")
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
                        
                        Text("\(viewModel.vaporBeats(for: game))")
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
                Button {
                    openEditGameSheet = true
                } label: {
                    
                    
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
                }
                
                Button {
                    viewModel.deleteGame(for: game)
                } label: {
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
            }
            
            
        }.padding(.horizontal).navigationTitle(Text(game.data))
            .sheet(isPresented: $openEditGameSheet){
                GameEditUIView(viewModel: viewModel, game: game, openEditGameSheet: $openEditGameSheet)
            }
        
    }
}

#Preview {
    GameDetailsUIView(viewModel: GameViewModel(), game: Game(data: "01.08.2024", stats: [
        Stat(hole: 1, par: 1, stroke: 1),
        Stat(hole: 1, par: 4, stroke: 8),
        Stat(hole: 1, par: 6, stroke: 6),
        Stat(hole: 1, par: 8, stroke: 2)]))
}



struct DetailsStatCell: View {
    @State var hole: String
    @State var par: String
    @State var stroke: String
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                
                Text(hole)
                Spacer()
                Text(par)
                Spacer()
                Text(stroke)
                
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
