//
//  CartItemView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 16.08.2024.
//

import SwiftUI

struct CartItemView: View {
    @State var item: CartItem
    var onCartCountValueChanged: () -> ()
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 133)
                    .background(
                        Image(item.product.images[0])
                            .resizable()
                            .aspectRatio(contentMode: .fill )
                            .frame(width: 100, height: 133)
                    )
                
                VStack(alignment: .leading) {
                    Text(item.product.tittle)
                        .font(.caption)
                    HStack(spacing: 20) {
                        Button {
                            if item.count > 0 {
                                item.count -= 1
                            }
                            
                            onCartCountValueChanged()
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .overlay {
                                    Image(systemName: "minus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .tint(.black)
                                        .frame(width: 14, height: 14)
                                }
                        }
                        .frame(width: 24, height: 24)
                        
                        Text("\(item.count)")
                            .font(.title2)
                        
                        Button {
                            if item.count > 0 {
                                item.count += 1
                            }
                            
                            onCartCountValueChanged()
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .overlay {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .tint(.black)
                                        .frame(width: 14, height: 14)
                                }
                        }
                        .frame(width: 24, height: 24)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 23)
    }
}

#Preview {
    CartItemView(item: .init(product: product1, count: 1)) {
        
    }
}
