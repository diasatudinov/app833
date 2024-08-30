//
//  HomeViewModel.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var equipments: [Equipment] = [] {
        didSet {
            saveEquipments()
        }
    }
    
    
    private let equipmentsFileName = "equipments.json"

    init() {
        loadEquipments()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func equipmentsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(equipmentsFileName)
    }
    
   
    
    private func saveEquipments() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.equipments)
                try data.write(to: self.equipmentsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadEquipments() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: equipmentsFilePath())
            equipments = try decoder.decode([Equipment].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
   
    
    
}
