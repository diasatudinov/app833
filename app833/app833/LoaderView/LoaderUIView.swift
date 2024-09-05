//
//  LoaderUIView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct LoaderUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true

    @State private var apiResponse: ApiResponse?
    private let apiService = ApiService()
    @State private var errorMessage: String?
    
    
    @AppStorage("isRequested") var isRequested: Bool = false
    @AppStorage("isBlock") var isBlock: Bool = true
    @State var isDead: Bool = true
    
    
    var body: some View {
        if isLoadingView {
            ZStack {
                Color.loaderBg
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("logog833")
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .onboardingBtn))
                            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
                            
                            
                    }
                    .foregroundColor(.black)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                    check_data()
                    fetch()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            
            if let response = apiResponse {
                if response.canUpdate {
                    ReOnboardingUIView()
                        .onAppear {
                            print(response.canUpdate)
                        }
                } else {
                    UsUIView(decodeString: response.isUncapitalized)
                        .onAppear {
                            print(response.canUpdate)
                        }
                }
            } else {
                ReOnboardingUIView()
                    .onAppear {
                        print("Error")
                    }
            }
            
        }
    }
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
    func fetch() {
        apiService.fetchData { result in
            switch result {
            case .success(let data):
                self.apiResponse = data
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func check_data() {
        
        guard isRequested == false else {
            
            return
        }
        
        let networkService = NetworkService()
        let deviceData = DeviceInfo.collectData()
        
        networkService.sendRequest(endpoint: deviceData) { result in
            
            isRequested = true
            
            switch result {
                
            case .success(let success):
                
                self.isBlock = success
                
            case .failure(_):
                
                self.isBlock = self.isDead
            }
        }
    }
}

#Preview {
    LoaderUIView()
}
