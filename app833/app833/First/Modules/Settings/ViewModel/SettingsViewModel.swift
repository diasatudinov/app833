//
//  SettingsViewModel.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    let standardNavBarHeight = UIScreen.main.bounds.height / 5.5
    
    func shareApp() {
        guard let url = URL(string: "https://apps.apple.com/app/golfstat-win-guru/id6670453682") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: Info().usagePolicy) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
