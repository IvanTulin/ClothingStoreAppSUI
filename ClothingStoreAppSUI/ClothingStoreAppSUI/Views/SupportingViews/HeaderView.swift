//
//  HeaderView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 14.08.2024.
//

import SwiftUI

struct HeaderView: View {
    
    var menuAction: ButtonAction
    var cartAction: ButtonAction
    
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    menuAction()
                }, label: {
                    Image(systemName: "list.dash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                })
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("fashionUnited")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 124, height: 54)
                    
                    
                Button(action: {
                    cartAction()
                }, label: {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                })
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(.white)
//        .background(.line.opacity(0.1))
        .zIndex(1)
        .shadow(radius: 0.3)
    }
}

//#Preview {
//    HeaderView()
//}
