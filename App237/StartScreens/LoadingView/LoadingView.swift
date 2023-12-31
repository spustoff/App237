//
//  LoadingView.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color("black_bg")
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            ProgressView()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    LoadingView()
}
