//
//  GameCellUIView.swift
//  app833
//
//  Created by Dias Atudinov on 29.08.2024.
//

import SwiftUI

struct GameCellUIView: View {
    @ObservedObject var viewModel: GameViewModel
    @State var game: Game
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                
                HStack {
                    VStack(spacing: 30) {
                        Text(game.data)
                            .font(.system(size: 20, weight: .semibold))
                        HStack(spacing: 23) {
                            Text("\(viewModel.hitsTotal(for: game)) hit")
                            Text("\(viewModel.pairsTotal(for: game)) pair")
                        }.font(.system(size: 13))
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        GameDetailsUIView(viewModel: viewModel, game: game)
                    } label: {
                        Text("More details")
                            .foregroundColor(.black)
                            .padding(25)
                            .padding(.horizontal, 20)// Добавляем отступы вокруг текста
                            .background(Color.white) // Устанавливаем цвет фона текста
                            .cornerRadius(10) // Закругляем углы текста
                            .overlay( // Добавляем обводку вокруг текста
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1) // Устанавливаем цвет и ширину обводки
                            )
                            .padding(.horizontal, 13)
                    }
                    
                }.padding(.bottom)
                
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.5)
            }
        }.frame(height: 100)
    }
}

#Preview {
    GameCellUIView(viewModel: GameViewModel(), game: Game(data: "", stats: []))
}
