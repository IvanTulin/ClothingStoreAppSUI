//
//  HashtagsView.swift
//  ClothingStoreAppSUI
//
//  Created by Ivan Tulin on 15.08.2024.
//

import SwiftUI

struct HashtagsView: View {
    var tags: [String]
    @State private var totalTagsHeight = CGFloat.zero
    
    var body: some View {
        GeometryReader(content: { geometry in
            generateTagsView(in: geometry)
        })
        .frame(height: totalTagsHeight)
    }
    
    private func generateTagsView(in g: GeometryProxy) -> some View {
        var w = CGFloat.zero
        var h = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                getItem(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(w - dimension.width) > g.size.width ) {
                            w = 0
                            h -= dimension.height
                        }
                        let result = w
                        if tag == tags.last {
                            w = 0
                        } else {
                            w -= dimension.width
                        }
                        
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { dimension in
                        let result = h
                        if tag == tags.last {
                            h = 0
                        }
                        return result
                    })
            }
        }
        .background(getViewHeight(binding: $totalTagsHeight))
    }
    
    @ViewBuilder
    private func getItem(for text: String) -> some View {
        Button {
            
        } label: {
            HStack(alignment: .top) {
                Text(text)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.bodyGray)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(.gray.opacity(0.1))
            .cornerRadius(30)
            
        }
    }
    
    private func getViewHeight(binding: Binding<CGFloat>) -> some View {
        return GeometryReader(content: { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        })
    }
}

#Preview {
    HashtagsView(tags: hashtags)
}
