//
//  Model.swift
//  Courses
//
//  Created by Никита Мартьянов on 5.03.24.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    //PAYMENT
    @Published var pythonPayment = false
    @Published var swiftPayment = false
    @Published var javaPayment = false
    @Published var kotlinPayment = false
    @Published var csharpPayment = false
    
    //TEST
    @Published var pythonComplete = false
    @Published var swiftComplete = false
    @Published var javaComplete = false
    @Published var kotlinComplete = false
    @Published var csharpComplete = false
    
    init() {
            pythonPayment = UserDefaults.standard.bool(forKey: "python")
            swiftPayment = UserDefaults.standard.bool(forKey: "swift")
            javaPayment = UserDefaults.standard.bool(forKey: "java")
            kotlinPayment = UserDefaults.standard.bool(forKey: "kotlin")
            csharpPayment = UserDefaults.standard.bool(forKey: "csharp")
        }

        func saveToUserDefaults() {
            UserDefaults.standard.set(pythonPayment, forKey: "python")
            UserDefaults.standard.set(swiftPayment, forKey: "swift")
            UserDefaults.standard.set(javaPayment, forKey: "java")
            UserDefaults.standard.set(kotlinPayment, forKey: "kotlin")
            UserDefaults.standard.set(csharpPayment, forKey: "csharp")
        }
    }


