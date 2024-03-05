//
//  ImageLoaderView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct ImageLoaderView: View {
    
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case let .success(image):
                image
                    .resizable()
                    .scaledToFill()
            case .empty:
                ProgressView()
                    .scaleEffect(2)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(url: "https://i.imgur.com/eoUVtjn.png")
    }
}

