//
//  Join.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color(red: 0/255, green: 174/255, blue: 237/255)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight:
                                .bold))
                            .padding(7)
                            .background(Circle().fill(.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
            
            Image("Join")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 8) {

                    Text("Join and earn")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("Join our Telegram group with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                            .padding()
                    })
                    .padding()
                    .padding(.bottom)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
