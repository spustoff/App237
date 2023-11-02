//
//  FactoryDetail.swift
//  App237
//
//  Created by IGOR on 31/10/2023.
//

import SwiftUI

struct FactoryDetail: View {
    
    @StateObject var viewModel: FactoriesViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("\(viewModel.level) Level")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: 35, height: 35)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    })
                }
                .padding()
                
                Text(viewModel.current_history?.factoryName ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(spacing: 10) {
                    
                    Text("My budget")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
                    Text("$\(viewModel.budget).00")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text(viewModel.current_history?.factoryDescription ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    VStack(spacing: 10) {
                        
                        Text("Improve your factory")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("$10,000.00")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                }
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
   
                        CurrenciesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        
                    })
                    .padding()
                    .padding(.bottom, 25)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    FactoryDetail(viewModel: FactoriesViewModel())
}
