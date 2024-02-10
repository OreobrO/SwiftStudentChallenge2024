//
//  GridItemView.swift
//
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct GridItemView: View {
    let size: Double
    let item: Item
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
        }
    }
}
