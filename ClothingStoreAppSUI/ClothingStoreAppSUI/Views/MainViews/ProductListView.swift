//
//  ProductListView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 16.08.2024.
//

import SwiftUI

struct ProductListView: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150 ))]
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("PRODUCTS")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView {
                        VStack {
                            ScrollView {
                                LazyVGrid(columns: adaptiveColumns, content: {
                                    ForEach(0..<products.count, id: \.self) { product in
                                        ProductItemView(product: products[product])
                                    }
                                })
                            }
                            .padding([.leading, .trailing], 20)
                            //FooterView()
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.top, 69)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    presentSideCart.toggle()
                }
            }
            
            SideMenu()
            SideCart()
        }
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContent(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContent(presentSideMenu: $presentSideCart)), direction: .leading)
    }
}

#Preview {
    ProductListView()
}
