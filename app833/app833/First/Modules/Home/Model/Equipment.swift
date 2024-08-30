//
//  Equipment.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import SwiftUI

struct Equipment: Identifiable, Hashable, Codable{
    let id = UUID()
    var imageData: Data?
    var name: String
    var material: String
    var weight: String
    var length: Int
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, material, weight, length
    }
    
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
    
}
