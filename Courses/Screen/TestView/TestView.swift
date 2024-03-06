//
//  TestView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var model = Model()
    
    var body: some View {
        NavigationStack {
            List {
                VStack(spacing: 20) {
                    Image("python")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    if model.pythonPayment == false {
                        Text("НЕТ ДОСТУПА")
                            .foregroundStyle(.gray)
                    }
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        PythonTest()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!model.pythonPayment)
                    
                }
                
                VStack(spacing: 20) {
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    if model.swiftPayment == false {
                        Text("НЕТ ДОСТУПА")
                            .foregroundStyle(.gray)
                    }
                    NavigationLink("Пройти тест по первым 5 урокам") {
                       SwiftTest()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!model.swiftPayment)
                }
                
                VStack(spacing: 20) {
                    Image("kotlin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    if model.kotlinPayment == false {
                        Text("НЕТ ДОСТУПА")
                            .foregroundStyle(.gray)
                    }
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        KotlinTest()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!model.kotlinPayment)
                }
                
                VStack(spacing: 20) {
                    Image("java")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    if model.javaPayment == false {
                        Text("НЕТ ДОСТУПА")
                            .foregroundStyle(.gray)
                    }
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        JavaTest()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!model.javaPayment)
                }
                
                VStack(spacing: 20) {
                    Image("csharp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    if model.pythonPayment == false {
                        Text("НЕТ ДОСТУПА")
                            .foregroundStyle(.gray)
                    }
                    NavigationLink("Пройти тест по первым 5 урокам") {
                       CSharpTest()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!model.csharpPayment)
                }
            }
            .padding(.bottom, 50)
            .navigationTitle("Тесты")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TestView()
}
