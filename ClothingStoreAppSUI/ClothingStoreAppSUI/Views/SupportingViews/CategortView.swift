//
//  CategortView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 14.08.2024.
//

import SwiftUI

struct CategortView: View {
    var isSelected: Bool = false
    var title: String = "All"
    
    var body: some View {
        VStack(spacing: 1) {
            Text(title)
                .font(Font.custom("Verdana-bold", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.default : Color.placeholder.opacity(0.5))
            
            if isSelected {
                Rectangle()
                    .foregroundColor(.default)
                    .frame(width: 5, height: 5)
                    .rotationEffect(Angle(degrees: 45))
                
            }
        }
    }
}

#Preview {
    CategortView()
}
