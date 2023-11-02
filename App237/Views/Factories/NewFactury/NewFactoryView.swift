//
//  NewFactoryView.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct NewFactoryView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = NewFactoryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New factory")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.factoryName.isEmpty ? .gray : .black)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.factoryName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.factoryName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.factoryDescription.isEmpty ? .gray : .black)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.factoryDescription.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.factoryDescription)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Construction cost")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.factoryCost.isEmpty ? .gray : .black)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.factoryCost.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.factoryCost)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    
                    VStack(alignment: .leading, spacing: 9) {
                        
                        Text("Currency that the plant earns")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Image("EURUSD")
                            
                            Text("EURUSD")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                }
                
                
                VStack(alignment: .leading, spacing: 9) {
                    
                    HStack {
                        
                        
                       Text("You will earn")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Text("$10.000")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.nfac += 1
                        
                        viewModel.addFactory(completion: {
                                                    
                            viewModel.factoryName.removeAll()
                            viewModel.factoryDescription.removeAll()
                            viewModel.factoryCost.removeAll()
                            viewModel.factoryEarn.removeAll()
                            
                            router.wrappedValue.dismiss()
                        })
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        
                    })
                    .padding(.bottom)
                    .disabled(viewModel.factoryName.isEmpty || viewModel.factoryCost.isEmpty || viewModel.factoryDescription.isEmpty ? true : false)
                    .opacity(viewModel.factoryName.isEmpty || viewModel.factoryCost.isEmpty || viewModel.factoryDescription.isEmpty ? 0.5 : 1)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    NewFactoryView()
}
