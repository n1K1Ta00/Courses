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
    
    @Published var rewards1 = false
    
    //TEST
    @Published var pythonComplete = false
    @Published var swiftComplete = false
    @Published var javaComplete = false
    @Published var kotlinComplete = false
    @Published var csharpComplete = false
    
    @Published var rewards2 = false
    
    //COMMENT
    @Published var rewards3 = false
    
    init() {
        pythonPayment = UserDefaults.standard.bool(forKey: "python")
        swiftPayment = UserDefaults.standard.bool(forKey: "swift")
        javaPayment = UserDefaults.standard.bool(forKey: "java")
        kotlinPayment = UserDefaults.standard.bool(forKey: "kotlin")
        csharpPayment = UserDefaults.standard.bool(forKey: "csharp")
        rewards1 = UserDefaults.standard.bool(forKey: "rewards1")
        rewards2 = UserDefaults.standard.bool(forKey: "rewards2")
        rewards3 = UserDefaults.standard.bool(forKey: "rewards2")
    }
    
    func saveToUserDefaults() {
        UserDefaults.standard.set(pythonPayment, forKey: "python")
        UserDefaults.standard.set(swiftPayment, forKey: "swift")
        UserDefaults.standard.set(javaPayment, forKey: "java")
        UserDefaults.standard.set(kotlinPayment, forKey: "kotlin")
        UserDefaults.standard.set(csharpPayment, forKey: "csharp")
        UserDefaults.standard.set(rewards1, forKey: "rewards1")
        UserDefaults.standard.set(rewards2, forKey: "rewards2")
        UserDefaults.standard.set(rewards3, forKey: "rewards3")
    }
}


