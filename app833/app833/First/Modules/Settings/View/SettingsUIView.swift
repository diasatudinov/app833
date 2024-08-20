//
//  SettingsUIView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Settings")
                        .font(.system(size: 17))
                        .bold()
                        .foregroundColor(.black)
                    
                }.padding(.top, 16)
                    .padding(.bottom, 29)
                
                
                ScrollView {
                    VStack(spacing: 14) {
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.onboardingBtn)
                            HStack {
                                Button {
                                    viewModel.shareApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "square.and.arrow.up.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Share App")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.gray.opacity(0.24))
                                                .cornerRadius(40)
                                            Text("Share")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.onboardingBtn)
                            HStack {
                                Button {
                                    viewModel.rateApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "star.square.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Rate Us")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.gray.opacity(0.24))
                                                .cornerRadius(40)
                                            Text("Rate")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.onboardingBtn)
                            HStack {
                                Button {
                                    viewModel.openUsagePolicy()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "person.badge.shield.checkmark.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        Text("Usage policy")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.gray.opacity(0.24))
                                                .cornerRadius(40)
                                            Text("Read")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                    }.padding(.horizontal)
                }
                
                Spacer()
            }.padding(.bottom, 96)
                
        }
    }
}
#Preview {
    SettingsUIView()
}
