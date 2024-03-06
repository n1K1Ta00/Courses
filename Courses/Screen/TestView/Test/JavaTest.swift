//
//  JavaTest.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct JavaTest: View {
    @ObservedObject var model = Model()
    
    let questions: [Question] = [
        Question(
            question: "Что такое Java?",
            options: ["Язык программирования для разработки приложений на платформе Java", "Модель представления данных", "Фреймворк"],
            correctAnswer: 0),
        Question(
            question: "Как обозначается комментарий в Java?",
            options: ["//", "/* */", "#"],
            correctAnswer: 1),
        Question(
            question: "Как объявить переменную в Java?",
            options: ["var", "let", "int"],
            correctAnswer: 2),
        Question(
            question: "Какой метод используется для вывода данных на экран в Java?",
            options: ["print()", "System.out.println()", "show()"],
            correctAnswer: 1),
        Question(
            question: "Какие типы циклов есть в Java?",
            options: ["for, while, do-while", "loop, for, while", "forEach, repeat-while"],
            correctAnswer: 0),
        Question(
            question: "Что такое индекс в Java?",
            options: ["Позиция элемента в списке", "Тип данных", "Идентификатор переменной"],
            correctAnswer: 0),
        Question(
            question: "Что такое массив в Java?",
            options: ["Неизменяемая коллекция элементов", "Изменяемая коллекция элементов", "Тип данных"],
            correctAnswer: 1),
        Question(
            question: "Сколько ключевых слов в Java для обозначения условий (if, else, switch)?",
            options: ["2", "3", "4"],
            correctAnswer: 1),
        Question(
            question: "Какой метод используется для получения длины массива в Java?",
            options: ["size()", "length()", "size"],
            correctAnswer: 1),
        Question(
            question: "Какой символ используется для обозначения целочисленного деления в Java?",
            options: ["/", "//", "%"],
            correctAnswer: 2)
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
            model.javaComplete = true
            model.saveToUserDefaults()
        }
    }
}

#Preview {
    JavaTest()
}
