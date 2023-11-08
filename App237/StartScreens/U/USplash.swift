//
//  USplash.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct USplash: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("black_bg")
                .ignoresSafeArea()
            
            Image("U1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                VStack(spacing: 8) {
                    
                    Text("Earn from your skills")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("Prove your success")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(Color.white.ignoresSafeArea())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    USplash(telegram: URL(string: "h")!, isTelegram: false)
}
