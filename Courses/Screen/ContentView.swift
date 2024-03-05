//
//  ContentView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    switch viewRouter.currentPage {
                    case .cours:
                        CourseListView()
                    case .tests:
                        TestView()
                    case .achivments:
                        AchievementsView()
                    case .communication:
                        CommunicationView()
                    }
                    
                    Spacer()
                    
                }
                VStack {
                    Spacer()
                    
                    TabBar(viewRouter: viewRouter, proxy: proxy)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView(viewRouter: ViewRouter())
    }
}
