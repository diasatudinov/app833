//
//  app833App.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

@main
struct app833App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoaderUIView()
        }
    }
}
