//
//  SwiftUIView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

import SwiftUI

struct TabBar: View {
    @StateObject var viewRouter: ViewRouter
    let proxy: GeometryProxy
    
    var body: some View {
        HStack(spacing: 30) {
            TabBarIcon(viewRouter: viewRouter, assignetPage: .cours, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "main")
            TabBarIcon(viewRouter: viewRouter, assignetPage: .tests, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "test")
            
            Spacer()
            
            TabBarIcon(viewRouter: viewRouter, assignetPage: .achivments, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "achivments")
            TabBarIcon(viewRouter: viewRouter, assignetPage: .communication, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "communication")
        }
        .frame(width: proxy.size.width - 2, height: proxy.size.height / 8)
        .background(TabBarCustomShape())
        .shadow(color: .black.opacity(0.1), radius: 5, y: 0)
    }
}



