//
//  ProductItemView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 14.08.2024.
//

import SwiftUI

struct ProductItemView: View {
    var product: Product
    
    var body: some View {
        NavigationLink {
            ProductDetailsView(product: product)
        } label: {
            VStack {
                Image(product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 165, height: 200)
                    .cornerRadius(5)
                .shadow(radius: 1)
                
                Text(product.tittle)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.bodyGray)
                    .frame(width: 165, alignment: .top)
                
                Text("$\(product.price)")
                    .font(.callout)
                    .foregroundColor(.default)
                    .padding(.top, 2)
            }
        }
        
        
    }
}

#Preview {
    ProductItemView(product: product1)
}
