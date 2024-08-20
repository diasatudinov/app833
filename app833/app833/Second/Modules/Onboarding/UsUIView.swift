//
//  UsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI
import StoreKit

struct UsUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false

    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.onboardingBg
                        .ignoresSafeArea()
                    
                    ZStack {
                        VStack(spacing: 0) {
                            Spacer()
                            switch pageNum {
                            case 1:
                                
                                Image("firstScreen")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            case 2: Image("ratings")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.bottom, 24)
                            default:
                                Image("notifications")
                                    .resizable()
                                    .frame(height: 549)
                                    .ignoresSafeArea()
                            }
                            Spacer()
                            switch pageNum {
                            case 1:
                                VStack(spacing: 24) {
                                    Text("Start now and earn more")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                    
                                    Text("A proven way to make easy money")
                                        .foregroundColor(.gray.opacity(0.7))
                                        .padding(.bottom, 102)
                                }
                            case 2:
                                VStack(spacing: 24) {
                                    Text("Rate our app in the \nAppStore")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .onAppear{
                                            rateApp()
                                        }
                                    Text("Help make the app even better")
                                        .foregroundColor(.gray.opacity(0.7))
                                        .padding(.bottom, 102)
                                }
                            default:
                                Text("Don’t miss anything")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                Text("Don’t miss the most userful information")
                                    .foregroundColor(.white).opacity(0.7)
                                
                            }
                            
                            Button {
                                if pageNum < 3 {
                                    pageNum += 1
                                } else {
                                    
                                }
                                
                                
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }.background(Color.onboardingBtn)
                                .cornerRadius(18)
                                .padding(.horizontal, 24)
                                .padding(.bottom)
                            
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(pageNum == 1 ? Color.onboardingBtn : Color.onboardingBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                
                                Circle()
                                    .fill(pageNum == 2 ? Color.onboardingBtn : Color.onboardingBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                
                                
                            }
                        }
                    }
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.onboardingBg
                            .ignoresSafeArea()
                        
                        ZStack {
                            VStack {
                                ZStack {
                                    Image("notifications")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        //.frame(height: 549)
                                        
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Button {
                                                isNotificationView = false
                                            } label: {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.black.opacity(0.19))
                                                    Image(systemName: "xmark")
                                                        .font(.system(size: 14, weight: .heavy))
                                                        .foregroundColor(.white)
                                                    
                                                }
                                            }
                                        }.padding(.horizontal, 32)
                                            .padding(.top, 48)
                                        Spacer()
                                    }
                                    
                                }.frame(height: 549).ignoresSafeArea()
                                VStack(spacing: 12) {
                                    Text("Don’t miss anything")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: 30)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .padding(.top, -32)
                                    Text("Don’t miss the most userful information")
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                Spacer()
                                Button {
                                    isNotificationView = false
                                    onboardingShowed = true
                                } label: {
                                    
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(height: 54)
                                            .foregroundColor(Color.onboardingBtn)
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                            .padding(.horizontal)
                                        Text("Enable notification").font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                }.background(Color.onboardingBtn)
                                    .cornerRadius(18)
                                    .padding(.horizontal, 24)
                                    .padding(.bottom)
                                
                            }
                        }
                    }
                    
                } else {
                   Text("Next screen")
                }
            }
        } else {
            Text("Next screen")
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
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}

#Preview {
    UsUIView()
}
