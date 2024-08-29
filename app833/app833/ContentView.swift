//
//  ContentView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showInputSheet = false
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var patronymic: String = ""
    @State private var isInputComplete = false
    
    var body: some View {
        VStack {
            if isInputComplete {
                // Display the user's input after submission
                Text("First Name: \(firstName)")
                Text("Last Name: \(lastName)")
                Text("Patronymic: \(patronymic)")
            } else {
                Text("No name entered yet.")
                    .padding()
            }
            
            // Button to trigger the input sheet
            Button("Enter Name") {
                showInputSheet.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .sheet(isPresented: $showInputSheet) {
            InputForm(
                firstName: $firstName,
                lastName: $lastName,
                patronymic: $patronymic,
                isInputComplete: $isInputComplete,
                showInputSheet: $showInputSheet
            )
        }
    }
}

struct InputForm: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var patronymic: String
    @Binding var isInputComplete: Bool
    @Binding var showInputSheet: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Patronymic", text: $patronymic)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Submit") {
                    isInputComplete = true
                    showInputSheet = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Spacer()
            }
            .navigationTitle("Enter Your Name")
            .navigationBarItems(trailing: Button("Cancel") {
                showInputSheet = false
            })
        }
    }
}

#Preview {
    ContentView()
}
