//
//  AddView.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var model = Model()
    
    @State private var name = ""
    @State private var course = "C#"
    @State private var comment = ""
    @State private var rating = 2
    
    var coment: Comments
    
    let courses = ["Python", "Swift", "Java", "Kotlin", "C#"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Введите имя", text: $name)
                
                Picker("Выберите курс", selection: $course) {
                    ForEach(courses, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Отзыв", text: $comment)
                
                VStack {
                    Text("Поставьте оценку:")
                    RatingView(rating: $rating)
                        .frame(width: 100, height: 30)
                }
            }
            .toolbar {
                Button("Сохранить") {
                    let items = CommentItem(name: name, course: course, rating: rating, comment: comment)
                    coment.items.append(items)
                    model.rewards3 = true
                    model.saveToUserDefaults()
                    dismiss()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView(coment: Comments())
}
