//
//  AchievementViewModel.swift
//  app833
//
//  Created by Dias Atudinov on 26.08.2024.
//

import Foundation

class AchievementViewModel: ObservableObject {
    @Published var achievements: [Achievement] = [
        Achievement(iconImage: "iconImage1", image: "image1", text: "Newbie", description: "Complete your first game. Record your results and start your golf journey.", complite: false),
        Achievement(iconImage: "iconImage2", image: "image4", text: "Streak of victories", description: "Complete 5 games in a row with improved scores. Improve your skills and monitor your progress.", complite: false),
        Achievement(iconImage: "iconImage3", image: "image2", text: "Perfect game", description: "Play the game with steam or better. Achieve perfect results on the field.", complite: false),
        Achievement(iconImage: "iconImage4", image: "image5", text: "Experienced player", description: "Complete 50 games. Keep playing and recording your achievements.", complite: false),
        Achievement(iconImage: "iconImage5", image: "image3", text: "Master of Precision", description: "Make 10 birdies. Prove your skill by completing 10 holes with a birdie score.", complite: false)
        
    ] {
        didSet {
            saveAchievements()
        }
    }
    
    private let tripsFileName = "achievements.json"
    
    init() {
        loadAchievements()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func achievementsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(tripsFileName)
    }
    
    private func saveAchievements() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.achievements)
                try data.write(to: self.achievementsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadAchievements() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: achievementsFilePath())
            achievements = try decoder.decode([Achievement].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func compliteToggle(index: Int) {
        achievements[index].complite.toggle()
        
    }
}
