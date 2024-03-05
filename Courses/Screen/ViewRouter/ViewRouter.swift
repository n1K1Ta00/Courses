//
//  ViewRouter.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .cours
    
}

enum Page {
    case cours
    case tests
    case achivments
    case communication
}

