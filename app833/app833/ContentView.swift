//
//  ContentView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI


struct ContentView: View {
    let colors: [Color] = [.red, .blue, .yellow]
    
    let items = Array(1...15) // Example data
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
                ForEach(items.indices, id: \.self) { index in
                    Text("Item \(items[index])")
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .background(colors[index % colors.count]) // Alternate colors
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            
            .padding()
        }
    }
}




#Preview {
    ContentView()
}
