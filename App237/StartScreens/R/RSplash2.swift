//
//  RSplash2.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct RSplash2: View {
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            Image("R2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                VStack(spacing: 8) {
                    
                    Text("Detailed statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("All the necessary statistics")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Rsplash3()
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
    RSplash2()
}
