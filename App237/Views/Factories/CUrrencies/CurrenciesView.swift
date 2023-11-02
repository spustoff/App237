//
//  CurrenciesView.swift
//  App237
//
//  Created by IGOR on 31/10/2023.
//

import SwiftUI

struct CurrenciesView: View {
    
    @Environment(\.presentationMode) var router
    
    @State var isClose: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency selection")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                NavigationLink(destination: {
                    
                    TradeView(isClose: $isClose)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        Image("EURUSD")
                        
                        Text("EURUSD")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding()
                })
                
                Spacer()
            }
        }
        .onChange(of: isClose) { newValue in
            
            router.wrappedValue.dismiss()
        }
    }
}

#Preview {
    CurrenciesView()
}
