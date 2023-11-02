//
//  SettingsVIEW.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI
import StoreKit
import CoreData

struct SettingsView: View {
    
    @AppStorage("budget") var budget: Int = 50000
    @AppStorage("income") var income: Int = 0
    @AppStorage("nfac") var nfac: Int = 0
    @AppStorage("level") var level: Int = 1
    @State var isReset: Bool = false
    @State var isStart: Bool = true

    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("p")))
                            
                            Text("Rate app")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/19twiE7deX1s-AeyLRCpxKC4KL81O3lvnQpVg4U_Yiw4/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "bubble.right.fill")
                                .foregroundColor(Color("prim"))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("p")))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.red))
                            
                            Text("Reset progress")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                }
                .padding()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("Your entire progress will be permanently deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        budget = 50000
                        income = 0
                        nfac = 0
                        level = 1
                        
                        isStart = true
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
