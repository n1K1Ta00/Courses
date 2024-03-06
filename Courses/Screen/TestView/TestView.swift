//
//  TestView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack(spacing: 20) {
                    Image("python")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        PythonTest()
                    }
                    
                }
                
                VStack(spacing: 20) {
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    NavigationLink("Пройти тест по первым 5 урокам") {
                       SwiftTest()
                    }
                }
                
                VStack(spacing: 20) {
                    Image("kotlin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        KotlinTest()
                    }
                }
                
                VStack(spacing: 20) {
                    Image("java")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    NavigationLink("Пройти тест по первым 5 урокам") {
                        JavaTest()
                    }
                }
                
                VStack(spacing: 20) {
                    Image("csharp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    NavigationLink("Пройти тест по первым 5 урокам") {
                       CSharpTest()
                    }
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
