//
//  TrendingHashtagsView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 15.08.2024.
//

import SwiftUI

struct TrendingHashtagsView: View {
    var body: some View {
        VStack {
            Text("@Trendings")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            HashtagsView(tags: hashtags)
                .padding([.leading, .trailing], 30)
        }
    }
}

#Preview {
    TrendingHashtagsView()
}
