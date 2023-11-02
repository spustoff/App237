//
//  FactoriesView.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct FactoriesView: View {
    
    @StateObject var viewModel = FactoriesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 9) {
                
                    Text("My budget")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Text("$\(viewModel.budget)")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                    
                    HStack {
                        
                        VStack(spacing: 8) {
                            
                            Text("My income")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("$\(viewModel.income)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 8) {
                            
                            Text("Number of factories")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("\(viewModel.nfac)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                }
                .padding()
                
                VStack(spacing: 9) {
                    
                    
                    if viewModel.factories.isEmpty {
                        
                        VStack {
                            
                            Text("You don't have factories yet")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                                .padding()
                            
                            Text("It's time to build your first factory and start making money")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            
                            NavigationLink(destination: {
                                
                                NewFactoryView()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Build a new factory")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                
                            })
                            .padding()
                            .padding(.horizontal)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        NavigationLink(destination: {
                            
                            NewFactoryView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Build a new factory")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                            
                        })
                        .padding()
                        
                        ScrollView(.vertical) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.factories, id: \.self) { index in
                                    
                     NavigationLink(destination: {
                         
                         FactoryDetail(viewModel: viewModel)
                             .onAppear{
                                 
                                 viewModel.current_history = index
                             }
                             .navigationBarBackButtonHidden()
                         
                     }, label: {
                         
                         VStack(spacing: 8) {
                             
                             Image("factory")
                             
                             Text("\(viewModel.level) Level")
                                 .foregroundColor(Color("prim"))
                                 .font(.system(size: 16, weight: .medium))
                                 .padding(.horizontal)
                                 .frame(height: 40)
                                 .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                             
                             Text(index.factoryName ?? "")
                                 .foregroundColor(.gray)
                                 .font(.system(size: 16, weight: .regular))
                             
                             Text("$10,000.00")
                                 .foregroundColor(.black)
                                 .font(.system(size: 26, weight: .semibold))
                         }
                         .padding()
                         .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                     })
                                }
                            })
                        }
                    }

                }
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.fetchFactories()
        }
        .onAppear {
            
            Timer.scheduledTimer(withTimeInterval: 900, repeats: true) { timer in
                                    
                    viewModel.income += 10000 * viewModel.nfac
                    viewModel.budget += 10000 * viewModel.nfac
                    
            }
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(viewModel.isStart ? 0.7 : 0)
                    .ignoresSafeArea()
     
                
                VStack {
                    
                    Image("Start")
                        .padding(.top)
                    
                    Text("Welcome!")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("From the government, you were allocated $50,000.00 for the development of the region. Start yours by building your first plant")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
           
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isStart = false
                        }
                        
                    }, label: {
                        
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        
                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .offset(y: viewModel.isStart ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)

            }
        )
    }
}

#Preview {
    FactoriesView()
}
