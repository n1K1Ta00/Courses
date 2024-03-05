//
//  Model.swift
//  Courses
//
//  Created by Никита Мартьянов on 5.03.24.
//

import SwiftUI
import Combine

class PaymentModel: ObservableObject {
    @Published var python = false
    @Published var swift = false
    @Published var java = false
    @Published var kotlin = false
    @Published var csharp = false
}

class TittleModel: ObservableObject {
    @Published var python = false
    @Published var swift = false
    @Published var java = false
    @Published var kotlin = false
    @Published var csharp = false
}


