//
//  Rsplash3.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct Rsplash3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            Image("R3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                VStack(spacing: 8) {
                    
                    Text("Complete tasks")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("Complete tasks and upgrade your factories")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        .padding()
                })
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(Color.white.ignoresSafeArea())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    Rsplash3()
}
