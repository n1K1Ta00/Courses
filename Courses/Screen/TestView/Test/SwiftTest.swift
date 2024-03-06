//
//  SwiftTest.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI
struct SwiftTest: View {
    let questions: [Question] = [
        Question(question: "Как объявить переменную в Swift?",
                     options: ["variable", "var", "let"],
                     correctAnswer: 2),
                     
            Question(question: "Что такое опционалы в Swift?",
                     options: ["Тип данных для хранения значения или отсутствия значения", "Переменная с неизменяемым значением", "Цикл в Swift"],
                     correctAnswer: 0),
                     
            Question(question: "Какие типы циклов существуют в Swift?",
                     options: ["for, while, do-while", "loop, for, while", "for, until, while"],
                     correctAnswer: 0),
                     
            Question(question: "Что такое массив в Swift?",
                     options: ["Неизменяемая коллекция элементов", "Изменяемая коллекция элементов", "Тип данных"],
                     correctAnswer: 1),
                     
            Question(question: "Как объединить две строки в Swift?",
                     options: ["combineStrings()", "merge()", "+ operator"],
                     correctAnswer: 2),
                     
            Question(question: "Какой символ используется для комментариев в Swift?",
                     options: ["//", "/* */", "#"],
                     correctAnswer: 0),
                     
            Question(question: "Что такое опциональное связывание ('optional binding') в Swift?",
                     options: ["Процесс извлечения значения опционала и присвоение его другой константе или переменной", "Механизм проверки ошибок в коде", "Тип данных"],
                     correctAnswer: 0),
                     
            Question(question: "Как создать функцию в Swift?",
                     options: ["func()", "function()", "define()"],
                     correctAnswer: 0),
                     
            Question(question: "Как проверить равенство двух переменных в Swift?",
                     options: ["==", "=", "===",],
                     correctAnswer: 0),
                     
            Question(question: "Какой оператор используется для нил-коалесценции в Swift?",
                     options: ["??", "???", "?:",],
                     correctAnswer: 0)
        ]


       @State private var currentQuestionIndex = 0
       @State private var correctAnswers = 0
       @State private var showAlert = false
    
    var body: some View {
            VStack {
                Text(questions[currentQuestionIndex].question)
                    .padding()

                ForEach(0..<questions[currentQuestionIndex].options.count, id: \.self) { index in
                    Button(action: {
                        checkAnswer(index)
                    }) {
                        Text(questions[currentQuestionIndex].options[index])
                            .padding()
                    }
                }
            }
            .alert("Результат", isPresented: $showAlert) {
                Button("OK") {
                    
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
        }
    }

#Preview {
    SwiftTest()
}
