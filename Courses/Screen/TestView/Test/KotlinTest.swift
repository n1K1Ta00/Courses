//
//  KotlinTest.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct KotlinTest: View {
    @ObservedObject var model = Model()
    
    let questions: [Question] = [
        Question(
            question: "Какой тип данных используется для хранения целых чисел в Kotlin?",
            options: ["Int", "String", "Float"],
            correctAnswer: 0),
        Question(
            question: "Как обозначается комментарий в Kotlin?",
            options: ["//", "/* */", "#"],
            correctAnswer: 0),
        Question(
            question: "Как создать пустой список в Kotlin?",
            options: ["listOf()", "{}", "emptyList()"],
            correctAnswer: 2),
        Question(
            question: "Какая функция используется для вывода данных на экран в Kotlin?",
            options: ["print()", "display()", "Text()"],
            correctAnswer: 0),
        Question(
            question: "Какие типы циклов есть в Kotlin?",
            options: ["for, while, do-while", "loop, for, while", "for-in, forEach, repeat-while"],
            correctAnswer: 0),
        Question(
            question: "Что такое индекс в Kotlin?",
            options: ["Число, указывающее на позицию элемента в списке", "Тип данных", "Ничего из перечисленного"],
            correctAnswer: 0),
        Question(
            question: "Что такое кортеж в Kotlin?",
            options: ["Неизменяемый список", "Изменяемый список", "Тип переменной"],
            correctAnswer: 0),
        Question(
            question: "Сколько ключевых слов в Kotlin для обозначения условий (if, else, when)?",
            options: ["2", "3", "4"],
            correctAnswer: 1),
        Question(
            question: "Какой метод используется для получения длины списка в Kotlin?",
            options: ["size()", "count()", "size"],
            correctAnswer: 0),
        Question(
            question: "Какой символ используется для обозначения целочисленного деления в Kotlin?",
            options: ["div", "//", "rem"],
            correctAnswer: 1)
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var correctAnswers = 0
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(questions[currentQuestionIndex].question)
                .padding()
                .font(.title)
            
            
            ForEach(0..<questions[currentQuestionIndex].options.count, id: \.self) { index in
                Button(action: {
                    checkAnswer(index)
                }) {
                    Text(questions[currentQuestionIndex].options[index])
                        .padding()
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
            }
        }
        .alert("Результат", isPresented: $showAlert) {
            Button("OK") {
                presentationMode.wrappedValue.dismiss()
            }
        } message: {
            Text("Количество правильных ответов: \(correctAnswers)")
        }
    }
    
    func checkAnswer(_ selectedOption: Int) {
        if selectedOption == questions[currentQuestionIndex].correctAnswer {
            correctAnswers += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showAlert = true
        }
        if correctAnswers == 10 {
            model.kotlinComplete = true
            model.saveToUserDefaults()
        }
    }
}

#Preview {
    KotlinTest()
}
