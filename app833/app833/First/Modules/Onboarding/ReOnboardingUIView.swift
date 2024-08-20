//
//  ReOnboardingUIView.swift
//  app833
//
//  Created by Dias Atudinov on 20.08.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    switch pageNum {
                    case 1: Image("appScreen1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 480)
                            .padding(.top, 60)
                            .padding(.bottom, 24)
                    case 2: Image("appScreen2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 480)
                            .padding(.top, 60)
                            .padding(.bottom, 24)
                    default:
                        Image("appScreen3")
                            .frame(height: 549)
                    }
                    switch pageNum {
                    case 1:
                        Text("Detailed reports for each \ngame")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.bottom)
                        Text("Don't forget to update the list")
                            .font(.system(size: 15))
                            .foregroundColor(.black.opacity(0.7))
                    case 2:
                        Text("Statistics on your \nachievements")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.bottom)
                        Text("Improve your results")
                            .font(.system(size: 15))
                            .foregroundColor(.black.opacity(0.7))
                    default:
                        Text("Statistics on your \nachievements")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    Spacer()
                    Button {
                        if pageNum < 2 {
                            pageNum += 1
                        } else {
                            signedUP = true
                        }
                    } label: {
                        Text("Next")
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }.background(Color.onboardingBtn)
                        .cornerRadius(18)
                        .padding(.horizontal, 45)
                        .padding(.bottom, 20)
                    HStack(spacing: 6) {
                        Circle()
                            .fill(pageNum == 1 ? Color.onboardingBtn : Color.onboardingBtn.opacity(0.5))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(pageNum > 1 ? Color.onboardingBtn : Color.onboardingBtn.opacity(0.5))
                            .frame(width: 8, height: 8)
                        
                    }.padding(.bottom, 30)
                }.ignoresSafeArea()
            }
        
             
        } else {
            TabUIView()
        }
    }
}

#Preview {
    ReOnboardingUIView()
}
