//
//  HomeViewModel.swift
//  app833
//
//  Created by Dias Atudinov on 30.08.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var equipments: [Equipment] = [
        Equipment(name: "TaylorMade Driver", material: "Graphite", weight: "300 g", length: "45 inches"),
        Equipment(name: "TaylorMade Driver", material: "Graphite", weight: "300 g", length: "45 inches"),
        Equipment(name: "TaylorMade Driver", material: "Graphite", weight: "300 g", length: "45 inches"),
        Equipment(name: "TaylorMade Driver", material: "Graphite", weight: "300 g", length: "45 inches")
    ] {
        didSet {
            saveEquipments()
        }
    }
    
    
    private let equipmentsFileName = "equipments.json"

    init() {
        loadEquipments()
    }
    
    func addEquipment(_ equipment: Equipment) {
        equipments.append(equipment)
    }
    
    func deleteEquipment(for equipment: Equipment) {
        if let index = equipments.firstIndex(where: { $0.id == equipment.id }) {
            equipments.remove(at: index)
            
        }
        
    }
    
//    func updateRating(for resort: ResortNatural, rating: Int) {
//        if let index = resorts.firstIndex(where: { $0.id == resort.id }) {
//            resorts[index].rating = rating
//        }
//    }
    
    func editEquipment(for equipment: Equipment) {
        if let index = equipments.firstIndex(where: { $0.name == equipment.name }) {
            print("EDIT")
            equipments[index].image = equipment.image
            equipments[index].name = equipment.name
            equipments[index].material = equipment.material
            equipments[index].weight = equipment.weight
            equipments[index].length = equipment.length
            
        }
        print("EDIT2")
        
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
