//
//  ProductDetailsView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 16.08.2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var product: Product
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    ScrollView {
                        TabView {
                            ForEach(0..<product.images.count, id: \.self) { image in
                                Image(product.images[image])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 500)
                                    .clipped()
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 500)
                        .padding([.leading, .trailing], 20)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(product.tittle)
                                Spacer()
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            }
                            
                            Text("$\(product.price)")
                                .font(.title2)
                                .foregroundStyle(.default)
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 20)
                        
                        Text("DESCRIPTION")
                            .font(Font.custom("Verdana", size: 19))
                            .padding(.top, 20)
                        
                        Text("\(product.description)")
                            .font(Font.custom("Verdana", size: 19))
                            .foregroundStyle(.secondary)
                            .padding(.top, 3)
                            .padding([.leading, .trailing], 20)
                        
                        Text("You may also like")
                            .font(Font.custom("Verdana", size: 22))
                            .padding(.top, 50)
                            .frame(height: 20)
                        
                        Image(.dividing)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160)
                            .padding(.top, 10)
                        
                        VStack {
                            HStack(alignment: .top) {
                                ProductItemView(product: product4)
                                ProductItemView(product: product2)
                            }
                            
                            HStack(alignment: .top) {
                                ProductItemView(product: product3)
                                ProductItemView(product: product5)
                            }
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text("Explore More")
                                    .font(Font.custom("Verdana", size: 24))
                                    
                                Image(systemName: "arrow.forward")
                                    .frame(width: 18, height: 18)
                            }
                            .padding(12)
                        }
                        .padding(.top, -30)
                    
                            
                    }
                    .padding(.top, 66)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    presentSideCart.toggle()
                }
            }
            .overlay(alignment: .bottom) {
                ZStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Add to basket")
                                .font(.title2)
                                .kerning(0.14)
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .tint(.white)
                        }
                        .padding([.leading, .trailing], 24)
                    }
                    

                }
                .frame(height: 66)
                .frame(maxWidth: .infinity)
                .background(.black)
            }
            
            
            SideMenu()
            SideCart()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
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
    ProductDetailsView(product: product1)
}
