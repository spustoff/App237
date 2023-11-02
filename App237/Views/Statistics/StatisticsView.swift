//
//  StatisticsView.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("nfac") var nfac: Int = 0
    @AppStorage("income") var income: Int = 0

    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
               Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                                
                VStack(spacing: 16) {
                    
                    Image("factory")
                    
                    Text("Number of factories")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Text("\(nfac)")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Total earnings")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("$\(income).00")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .padding()
                        .frame(width: 200, height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Money spent")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("$0.00")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .padding()
                        .frame(width: 200, height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .padding(.leading)
                    }
                }
                .frame(height: 100)
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    StatisticsView()
}
