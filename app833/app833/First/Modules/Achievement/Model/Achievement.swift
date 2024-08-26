//
//  Achievement.swift
//  app833
//
//  Created by Dias Atudinov on 26.08.2024.
//

import Foundation

struct Achievement: Identifiable, Hashable, Codable {
    var id = UUID()
    let iconImage: String
    let image: String
    let text: String
    let description: String
    var complite: Bool
}
