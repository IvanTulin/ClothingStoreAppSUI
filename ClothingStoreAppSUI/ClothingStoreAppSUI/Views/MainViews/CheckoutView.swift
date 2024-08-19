//
//  CheckoutView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 19.08.2024.
//

import SwiftUI

struct CheckoutView: View {
    @State var presentSideMenu = false
    @State var presentSideCart = false
    @State private var totalPrice = 0
    
    var body: some View {
        ZStack {
            //MainCartView()
            PaymentSuccessView()
        }
        .onAppear {
            upateCartValue()
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    private func MainCartView() -> some View {
        Color.white.edgesIgnoringSafeArea(.all)
        ZStack {
            VStack {
                Text("CHECKOUT")
                    .font(.title)
                    .kerning(4)
                    .multilineTextAlignment(.center)
                .frame(height: 32, alignment: .center)
                
                Image(.dividing)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                    .padding(.top, -25)
                
                ScrollView {
                    VStack {
                        ForEach(0..<cartItems.count, id: \.self) { item in
                            if cartItems[item].count > 0 {
                                CartItemView(item: cartItems[item]) {
                                    upateCartValue()
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing], 20)
                }
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(.bodyGray)
                    Button {
                        
                    } label: {
                        Image("voucherIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                        Text("Add promo code")
                            .font(.callout)
                            .foregroundStyle(.bodyGray)
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(.bodyGray)
                    Button {
                        
                    } label: {
                        Image("deliveryIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                        Text("Delivery")
                            .font(.callout)
                            .foregroundStyle(.bodyGray)
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(.bodyGray)

                })
                
                HStack(alignment: .bottom, content: {
                    Text("EST. TOTAL")
                        .font(.subheadline)
                        .kerning(2)
                    Spacer()
                    Text("$\(totalPrice)")
                        .font(.callout)
                        .foregroundStyle(.default)
                })
                .padding([.leading, .trailing], 20)
                .frame(height: 65)
                
                Button {
                    
                } label: {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                        .frame(width: 20, height: 20)
                        .colorInvert()
                    Text("PLACE ORDER")
                        .font(.callout)
                        .kerning(0.16)
                        .tint(.white)
                }
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(.black)
                
                
            }
            .padding(.top, 56)
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
    
    @ViewBuilder
    private func PaymentSuccessView() -> some View {
        ZStack {
            Color.bodyGray.opacity(0.91).edgesIgnoringSafeArea(.all )
            
            VStack(alignment: .center, spacing: 10) {
                Text("PAYMENT SUCCESS")
                    .font(.title2)
                    .kerning(8)
                    .padding(.top, 20)
                
                Image("successCompleteIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                
                Text("Your payment was success")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.bodyGray)
                
                Text("Payment ID \(1232413)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.labell)
                
                Button {
                    
                } label: {
                    HStack(alignment: .center, spacing: 10, content: {
                        Text("BACK TO HOME")
                            .font(.title2)
                            .foregroundStyle(.black)
                    })
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay {
                        Rectangle()
                            .inset(by: 0.5)
                            .stroke(Color.black.opacity(0.8), lineWidth: 1)
                    }
                    .padding([.top, .bottom], 20)
                }

            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .padding([.leading, .trailing], 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContent(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContent(presentSideMenu: $presentSideCart)), direction: .leading)
    }
    
    private func upateCartValue() {
        var value: Int = 0
        for item in cartItems {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
}

#Preview {
    CheckoutView()
}
