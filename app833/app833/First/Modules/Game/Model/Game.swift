//
//  Game.swift
//  app833
//
//  Created by Dias Atudinov on 29.08.2024.
//

import Foundation

struct Game: Identifiable, Hashable, Codable {
    var id = UUID()
    var data: String
    var stats: [Stat]
    
}

struct Stat: Identifiable, Hashable, Codable {
    var id = UUID()
    let hole: Int
    let par: Int
    let stroke: Int
}

struct Graph: Codable {
    let first: String
    let second: String
    let third: String
}
