//
//  SideCartView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 16.08.2024.
//

import SwiftUI

struct SideCartViewTemp: View {
    @State var presentSideMenu = true
    
    var body: some View {
        ZStack {
            createSideCartMenu()
        }
        .background(.black)
    }
    
    @ViewBuilder
    private func createSideCartMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCartViewContent(presentSideMenu: $presentSideMenu)), direction: .trailing)
    }
}

#Preview {
    SideCartViewTemp()
}

struct SideCartViewContent: View {
    @Binding var presentSideMenu: Bool
    @State private var totalPrice: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            createSideMenuTopView()
                .padding([.leading, .trailing], 20)
            
            Text("CART")
                .font(Font.custom("Verdana-Bold", size: 24))
                .padding([.leading, .trailing], 20)
                .foregroundColor(.gray)
            
            if cartItems.count > 0 {
                createCartFullView()
            } else {
                createEmptyCartView()
            }
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    Text("Continue Shopping")
                    
                }
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(.black)
                .foregroundColor(.white)
            }

        }
        .onAppear {
            upateCartValue()
        }
    }
    
    @ViewBuilder
    private func createSideMenuTopView() -> some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.gray)
                }
                .frame(width: 20, height: 20)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
    // This is show when cart is empty
    @ViewBuilder
    private func createEmptyCartView() -> some View {
        VStack(alignment: .leading) {
            Text("You have no items in your shopping bag")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.placeholder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func createCartFullView() -> some View {
        VStack(alignment: .leading) {
            VStack {
                ScrollView {
                    ForEach(0..<cartItems.count, id: \.self) { item in
                        if cartItems[item].count > 0 {
                            CartItemView(item: cartItems[item]) {
                                upateCartValue()
                            }
                        }
                    }
                }
                .padding([.leading, .trailing])
                
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(.bodyGray)
                    
                    HStack {
                        Text("SUB TOTAL")
                        
                        Spacer()
                        
                        Text("$\(totalPrice)")
                            .font(.title2)
                            .foregroundStyle(.default)
                        
                    }
                    .padding([.leading, .trailing], 30 )
                    
                    Text("*shipping charges, taxes and discount codes are calculated at the time of accounting. ")
                        .font(.subheadline)
                        .foregroundColor(.placeholder)
                        .frame(height: 73, alignment: .topLeading)
                        .padding([.leading, .trailing], 20)
                }
                .frame(minHeight: 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func upateCartValue() {
        var value: Int = 0
        for item in cartItems {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
    
}
