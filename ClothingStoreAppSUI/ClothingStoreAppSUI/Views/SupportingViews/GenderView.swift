//
//  GenderView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 15.08.2024.
//

import SwiftUI

struct GenderView: View {
    var isSelected: Bool = true
    var title: String = "WOMEN"
    
    var body: some View {
        VStack(spacing: 1) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? .default.opacity(0.5) : .placeholder.opacity(0.9))
            
            if isSelected {
                ZStack {
                    Rectangle()
                        .foregroundColor(.default.opacity(0.5))
                        .frame(height: 1)
                    
                    Rectangle()
                        .foregroundColor(.default.opacity(0.5))
                        .frame(width: 5, height: 5)
                        .rotationEffect(Angle(degrees: 45))
                }
            } else {
                Divider()
            }
            
        }
    }
}

#Preview {
    GenderView()
}
