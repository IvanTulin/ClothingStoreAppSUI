//
//  CartItem.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 16.08.2024.
//

import Foundation

final class CartItem {
    var product: Product
    var count: Int = 0
    
    init(product: Product, count: Int) {
        self.product = product
        self.count = count
    }
}
