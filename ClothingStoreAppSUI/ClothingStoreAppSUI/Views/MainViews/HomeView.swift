//
//  HomeView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 01.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State var presentSideMenu = false
    @State private var selectedCategory: Int = 0
    
    private var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.TShirt.rawValue, Categories.Bag.rawValue]
    
    
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 10) {
                    ScrollView(.vertical) {
                        HeroImageView()
                        NewArrivalView()
                        Spacer()
                        Image(.dividing)
                            .resizable()
                            .frame(width: 150, height: 40)
                        Image(.brands2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(.dividing)
                            .resizable()
                            .frame(width: 150, height: 40)
                        CollectionsView()
                        TrendingHashtagsView()
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    
                }
            }
            
            SideMenu()
        }
        .onAppear {
           // print(product2.images.count)
        }
    }
    
    @ViewBuilder
    private func HeroImageView() -> some View {
        ZStack {
            Image("backgroundVertical")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity)
                .frame(height: 620)
            
            Button {
                print("Explore Collection button clicked")
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .overlay {
                        Text("Explore Collection")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    }
                   
                    
            }
            .frame(width: 253, height: 40)
            .tint(.black.opacity(0.4))
            .offset(.init(width: 0, height: 250))
        }
    }
    
    @ViewBuilder
    private func NewArrivalView() -> some View {
        Text("New Arrival")
            .font(Font.custom("Helvetica-Bold", size: 28))
            .multilineTextAlignment(.center)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 25)
        
        Image(.dividing)
            .resizable()
            .frame(width: 150, height: 40)
        
        Spacer().frame(height: 29)
        
        VStack {
            
            HStack(spacing: 20) {
                ForEach(0..<categories.count, id: \.self) { item in
                    CategortView(isSelected: item == selectedCategory, title: categories[item])
                        .onTapGesture {
                            selectedCategory = item
                        }
                         
                }
            }
            .frame(maxWidth: .infinity)
            
            Spacer().frame(height: 29)
            
            HStack {
                ProductItemView(product: product1)
                ProductItemView(product: product2)
            }
            
            Spacer().frame(height: 19)
            
            HStack {
                ProductItemView(product: product3)
                ProductItemView(product: product4)
            }
            
            Button {
                
            } label: {
                HStack(alignment: .center, spacing: 0, content: {
                    Text("Explore more")
                        .font(.title)
                        .multilineTextAlignment(.center)
                })
                
                Image(systemName: "arrow.forward")
                    .frame(width: 18, height: 18)
            }
            .foregroundColor(.bodyGray)
            .padding(12)
        }
    }
    
    @ViewBuilder
    private func CollectionsView() -> some View {
       Text("Collections")
            .font(.largeTitle)
            .foregroundStyle(.black)
        
        Image(.autumn)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 384, alignment: .top)
            .clipped()
        
        Image(.octoberCollection)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 384, alignment: .top)
            .clipped()
        
        Image(.dividing)
            .resizable()
            .frame(width: 150, height: 40)
        
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContent(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        
    }
    
    
}

#Preview {
    HomeView()
}
