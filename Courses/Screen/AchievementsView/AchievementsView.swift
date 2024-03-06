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
    var reward: String
    var isComplete: Bool
   }

struct AchievementsView: View {
    @State private var sliderValue: Double = 0.0
    @State private var disabledSlider = false
    @ObservedObject var model = Model()
    
     @State private var achievements: [Achievements] = [
        Achievements(title: "Ученик", condition: "Купить 1 курс", reward: "Скидка на курс 20%", isComplete: true),
        Achievements(title: "Знаток", condition: "Набрать 10 очков в любом тесте", reward: "", isComplete: true),
        Achievements(title: "Поклонник", condition: "Напишите отзыв", reward: "", isComplete: true)
       ]
    
    var body: some View {
        VStack {
            Text("Достижения")
                .font(.title)
            
            List($achievements, id: \.title) { $achievement in
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
                    Text("Награда: \(achievement.reward)")
                        .font(.headline)
                    Slider(value: $sliderValue, in: 0.0...1.0, step: 1.0)
                        .disabled(!disabledSlider)
                        .accentColor(achievement.isComplete ? .gray : .green)
                }
            }
            .onTapGesture {
                achievement.isComplete.toggle()
            }
            }
        }
    }
}



#Preview {
    AchievementsView()
}
