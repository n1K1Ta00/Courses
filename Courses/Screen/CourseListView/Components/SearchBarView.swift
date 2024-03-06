//
//  SearchBarView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.Text.black : Color.Text.gray
                )
            TextField("Поиск по имени...", text: $searchText)
                .foregroundColor(Color.Text.black)
                .autocorrectionDisabled(true)
                .submitLabel(.done)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.Text.black)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(
                    Color.gray,
                    lineWidth: 2
                )
        )
    }
}

#Preview {
        SearchBarView(searchText: .constant(""))
    }


