//
//  GameViewModel.swift
//  app833
//
//  Created by Dias Atudinov on 29.08.2024.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game] = [
        Game(data: "01.08.2024", stats: [
            Stat(hole: 1, par: 1, stroke: 1),
            Stat(hole: 1, par: 4, stroke: 8),
            Stat(hole: 1, par: 6, stroke: 6),
            Stat(hole: 1, par: 8, stroke: 2)]),
        Game(data: "20.05.2024", stats: [
            Stat(hole: 1, par: 1, stroke: 1),
            Stat(hole: 1, par: 5, stroke: 2),
            Stat(hole: 1, par: 7, stroke: 5),
            Stat(hole: 1, par: 5, stroke: 4)
        ])
        
    ] {
        didSet {
            saveGames()
        }
    }
    
    @Published var graph: Graph = Graph(first: "-", second: "-", third: "-") {
        didSet {
            saveGraph()
        }
    }
    
    func saveGraph(for graph: Graph) {
        self.graph = graph
    }
    
    private let gamesFileName = "games.json"
    private let graphFileName = "graph.json"
    init() {
        loadGames()
        loadGraph()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func gamesFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(gamesFileName)
    }
    
    private func graphFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(graphFileName)
    }
    
    private func saveGames() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.games)
                try data.write(to: self.gamesFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveGraph() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.graph)
                try data.write(to: self.graphFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadGames() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: gamesFilePath())
            games = try decoder.decode([Game].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    private func loadGraph() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: graphFilePath())
            graph = try decoder.decode(Graph.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func hitsAllTotal() -> String {
        var sum = 0
        games.forEach { game in
            game.stats.forEach { stat in
                sum += stat.stroke
                
            }
            
        }
        return "\(sum)"
    }
    
    func hitsTotal(for game: Game) -> String {
        var sum = 0
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games[index].stats.forEach { stat in
                sum += stat.stroke
                
            }
        }
        
        return "\(sum)"
    }
    
    func pairsTotal(for game: Game) -> String {
        var sum = 0
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games[index].stats.forEach { stat in
                sum += stat.par
                
            }
        }
        
        return "\(sum)"
    }
    
    func vaporQuantity(for game: Game) -> Int {
        var sum = 0
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games[index].stats.forEach { stat in
                sum += stat.par
                
            }
        }
        
        return sum
    }
    
    func vaporBeats(for game: Game) -> String {
        var sum = 0
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games[index].stats.forEach { stat in
                sum += stat.stroke
                
            }
        }
        
        return "\(sum)"
    }
    
    func addGame(for game: Game) {
        games.append(game)
    }
    
    func deleteGame(for game: Game) {
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games.remove(at: index)
            
        }
        
    }
    
    func editGame(for game: Game, stats: [Stat]) {
        if let index = games.firstIndex(where: { $0.id == game.id }) {
            games[index].stats.append(contentsOf: stats)
            
        }
        
    }
}
