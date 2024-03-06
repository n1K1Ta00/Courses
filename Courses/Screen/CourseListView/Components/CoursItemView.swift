//
//  CoursItemView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct CoursItemView: View {
    let title: String
    let imageURL: String
    let amount: Double
    let footerText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(url: imageURL)
                .frame(width: screen.width * 1.06, height: screen.height)
                .background(
                    Color.gray.opacity(0.3)
                )
                .overlay(
                    overlayCard
                    , alignment: .top
                )
                .clipShape(RoundedRectangle(cornerRadius: 24))
            
            Text(title)
                .font(.system(size: 20).bold())
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(width: screen.width, height: 20 * 2, alignment: .leading)
                .background(.clear)
                .cornerRadius(10)
            
            footer
        }
    }
    
    var overlayCard: some View {
        HStack {
            HStack(spacing: 0) {
                Text(amount, format: .currency(code: "BYN"))
                    .foregroundColor(Color.Text.white)
            }
            .padding(.all, 2)
            .padding(.horizontal, 4)
            .background(Color.gray.cornerRadius(8))
            Spacer()
        }
        .padding()
    }
    
    var footer: some View {
        HStack {
            Text(footerText)
                .padding(.leading, 6)
                .foregroundColor(Color.Text.gray)
                .frame(width: screen.width - 40, height: 20 * 2.4, alignment: .leading)
                .background(.clear)
                .cornerRadius(10)
        }
    }
}

var screen: CGSize {
    return CGSize(
        width: UIScreen.main.bounds.width - 32,
        height: 200
    )
}

#Preview {
        NavigationView {
            CoursItemView(title: "Pyhton", imageURL: "https://i.imgur.com/eoUVtjn.png", amount: 500, footerText: "IT Progger")
        }
    }
