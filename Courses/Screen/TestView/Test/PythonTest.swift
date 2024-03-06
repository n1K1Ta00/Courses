//
//  Python.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct Question {
    var question: String
    var options: [String]
    var correctAnswer: Int
}

struct PythonTest: View {
    let questions: [Question] = [
           Question(question: "Какой тип данных используется для хранения целых чисел в Python?",
                    options: ["Int", "String", "Float"],
                    correctAnswer: 0),
           
           Question(question: "Как обозначается комментарий в Python?",
                    options: ["//", "/* */", "#"],
                    correctAnswer: 2),
           
           Question(question: "Как создать пустой список в Python?",
                    options: ["list()", "{}", "[]"],
                    correctAnswer: 2),

           Question(question: "Какая функция используется для вывода данных на экран в Python?",
                    options: ["print()", "display()", "show()"],
                    correctAnswer: 0),

           Question(question: "Какие типы циклов есть в Python?",
                    options: ["for, while, do-while", "loop, for, while", "for, while"],
                    correctAnswer: 2),

           Question(question: "Что такое индекс в Python?",
                    options: ["Число, указывающее на позицию элемента в списке", "Тип данных", "Ничего из перечисленного"],
                    correctAnswer: 0),

           Question(question: "Что такое кортеж в Python?",
                    options: ["Неизменяемый список", "Изменяемый список", "Тип переменной"],
                    correctAnswer: 0),

           Question(question: "Сколько ключевых слов в Python для обозначения условий (if, else, elif)?",
                    options: ["2", "3", "4"],
                    correctAnswer: 1),

           Question(question: "Какой метод используется для получения длины списка в Python?",
                    options: ["size()", "length()", "len()"],
                    correctAnswer: 2),

           Question(question: "Какой символ используется для обозначения целочисленного деления в Python?",
                    options: ["/", "//", "%"],
                    correctAnswer: 1)
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
    PythonTest()
}
