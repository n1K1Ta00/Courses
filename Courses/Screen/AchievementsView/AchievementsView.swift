//
//  AchievementsView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct Achievements {
    var title: String
    var condition: String
    var isComplete: Bool
    
    init() {
           self.title = "Первое достижение"
           self.condition = "Купить 1 курс"
           self.isComplete = false
       }
   }

struct AchievementsView: View {
    @State private var sliderValue: Double = 1.0
    @State private var disabledSlider = false
    
    @State private var complete1 = false
    @State private var complete2 = false
    @State private var complete3 = false
    
    var achievements: [Achievements] = [
           Achievements(),
           Achievements(title: "Второе достижение", condition: "Набрать 10 очков в любом тесте", isComplete: false),
           Achievements(title: "Третье достижение", condition: "Напишите отзыв", isComplete: false)
       ]
    
    var body: some View {
        VStack {
            Text("Достижения")
                .font(.title)
            
        List(achievements, id: \.title) { achievement in
            HStack {
                Image("achivments")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text(achievement.title)
                        .font(.headline)
                    Text("Условие: \(achievement.condition)")
                        .font(.subheadline)
                    Slider(value: $sliderValue, in: 0.0...1.0, step: 1.0)
                        .disabled(!disabledSlider)
                        .accentColor(achievement.isComplete ? .gray : .green)
                }
            }
            }
        }
    }
}

#Preview {
    AchievementsView()
}
