//
//  AchievementsView.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct AchievementsView: View {
    
    @AppStorage("nfac") var nfac: Int = 0
    @AppStorage("income") var income: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Achievements")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    HStack{
                        
                        Text("Level 1")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Spacer()
                        
                        Text("\(String(format: "%.f", Double(calculatePercentage())))%")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                            .padding(.horizontal)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                        
                    }
                    
                    HStack {
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(width: 25, height: 25)
                            .background(Circle().fill(income >= 250000 ? Color("prim") : .gray))
                        
                        Text("Build a factory for $250,000")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    
                    HStack {
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(width: 25, height: 25)
                            .background(Circle().fill(income >= 500000 ? Color("prim") : .gray))
                        
                        Text("Earn $500,000")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("Level 2")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text("0%")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("Level 3")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text("0%")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("Level 4")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text("0%")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("Level 5")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text("0%")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
            }
            }
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = income
        let maxValue = 500000
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    AchievementsView()
}
