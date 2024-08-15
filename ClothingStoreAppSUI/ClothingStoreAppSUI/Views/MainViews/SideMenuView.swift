//
//  SideMenu.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 15.08.2024.
//

import SwiftUI

struct SideMenuView: View {
    @State var presentSideMenu = true
    
    var body: some View {
        ZStack {
            createSideMenuView()
                .background(.black)
        }
    }
    
    @ViewBuilder
    private func createSideMenuView() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContent(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
}

#Preview {
    SideMenuView()
}


struct SideMenuViewContent: View {
    @Binding var presentSideMenu: Bool
    
    var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.TShirt.rawValue, Categories.Bag.rawValue]
    
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        HStack {
            ZStack {
                VStack(alignment: .leading) {
                    createSideMenuTopView()
                    
                    HStack(spacing: 10) {
                        GenderView(isSelected: selectedCategory == 0, title: "WOMEN")
                            .onTapGesture {
                                selectedCategory = 0
                            }
                        GenderView(isSelected: selectedCategory == 1, title: "MEN")
                            .onTapGesture {
                                selectedCategory = 1
                            }
                        GenderView(isSelected: selectedCategory == 2, title: "KIDS")
                            .onTapGesture {
                                selectedCategory = 2
                            }
                    }
                    .frame(maxWidth: .infinity)
                    
                    ForEach(0..<categories.count, id: \.self) { item in
                        createCategoryItem(title: categories[item]) {
                            
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "candybarphone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("(786)-XXX-8616")
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        .foregroundStyle(.black)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "mappin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("Store locator")
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        .foregroundStyle(.black)
                    })
                    
                    VStack(alignment: .center) {
                        Image(.dividing)
                            .resizable()
                            .frame(width: 140, height: 40)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    
                    
                    HStack(spacing: 30) {
                        Spacer()
                        Image("twitterLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Image("youtubeIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Image("instagramIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding([.leading, .trailing], 20)
    }
    
    func createSideMenuTopView() -> some View {
        VStack {
            HStack {
                Button(action: {
                    presentSideMenu.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.gray)
                })
                .frame(width: 18, height: 24)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
    @ViewBuilder
    func createCategoryItem(title: String, action: @escaping (() -> Void)) -> some View {
        Button(action: {
            action()
        }, label: {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Verdana", size: 16))
                    .foregroundStyle(.bodyGray)
            }
        })
        .frame(height: 50)
        .padding(.leading, 30)
        .padding(.top, 10)
    }
}
