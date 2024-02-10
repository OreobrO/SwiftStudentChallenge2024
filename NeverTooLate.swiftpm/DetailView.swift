//
//  File.swift
//  
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct DetailView: View {
    let item: Item
    
    var body: some View {
        AsyncImage(url: item.url) { image in
            DrawingView(image: image)
 } placeholder: {
            ProgressView()
        }
    }
}
