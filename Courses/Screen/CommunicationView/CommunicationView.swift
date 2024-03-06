//
//  CommunicationView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct CommentItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let course: String
    let rating: Int
    let comment: String
}

@Observable
class Comments {
    var items = [CommentItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

init() {
    if let savedItems = UserDefaults.standard.data(forKey: "Items") {
        if let decodedItems = try? JSONDecoder().decode([CommentItem].self, from: savedItems) {
            items = decodedItems
            return
        }
    }
    
    items = []
}
}

struct CommunicationView: View {
    @State private var comments = Comments()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(comments.items) { item in
                    Section {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.course)
                                    .font(.headline)
                                
                                HStack {
                                    Image(systemName: "person.crop.circle")
                                    Text(item.name)
                                }
                                
                                HStack {
                                    Image(systemName: "message")
                                    Text(item.comment)
                                }
                                
                                RatingView(rating: .constant(Int(item.rating)))
                                    .frame(width: 135, height: 20)
                            }
                            
                            Spacer()
                            
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Отзывы")
            .toolbar {
                Button("Add Comment", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(coment: comments)
                     }
        }
    }
            func removeItems(at offsets : IndexSet) {
                comments.items.remove(atOffsets: offsets)
            }
    }
#Preview {
    CommunicationView()
}
