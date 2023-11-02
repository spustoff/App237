//
//  TradeView.swift
//  App237
//
//  Created by IGOR on 31/10/2023.
//

import SwiftUI

struct TradeView: View {
    
    @Environment(\.presentationMode) var router
    
    @Binding var isClose: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg2")
            
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
                
                TradeChart(pair: "EURUSD")
                    .disabled(true)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                        isClose.toggle()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                        isClose.toggle()

                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    TradeView(isClose: .constant(false))
}
