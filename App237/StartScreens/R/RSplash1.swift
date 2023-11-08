//
//  RSplash1.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct RSplash1: View {
    
    var body: some View {

        ZStack {
            
            Color("black_bg")
                .ignoresSafeArea()
            
            Image("R1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                VStack(spacing: 8) {
                    
                    Text("Build factories")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("Earn money from your factories and achieve success")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    RSplash2()
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
    RSplash1()
}
