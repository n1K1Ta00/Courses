//
//  AchievementsView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct AchievementsView: View {
    @State private var sliderValue: Double = 0.0
    @State private var disabledSlider = false
    @State private var showingAlert = false
    
    @ObservedObject var model = Model()
    
    @State private var title1 = "Первая покупка"
    @State private  var condition1 = "Приобретите курс"
    @State private var reward1 = "Промокод на скидку 20%"
    
    @State private var title2 = "Гений"
    @State private  var condition2 = "Пройдите любой тест на 10 баллов"
    @State private var reward2 = ""
    
    @State private var title3 = "Поклонник"
    @State private  var condition3 = "Напишите отзыв"
    @State private var reward3 = ""
    
    var body: some View {
        VStack {
            Text("Достижения")
                .font(.title)
            
            List {
                HStack {
                    Image("achivments")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text(title1)
                            .font(.headline)
                        Text("Условие: \(condition1)")
                            .font(.subheadline)
                        Text("Награда: \(reward1)")
                            .font(.headline)
                        Image(systemName: model.rewards1 ? "checkmark.square.fill" : "square")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                        Button("Получить награду") {
                            showingAlert = true
                        }
                        .disabled(!model.rewards1)
                    }
                }
                
                HStack {
                    Image("achivments")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text(title2)
                            .font(.headline)
                        Text("Условие: \(condition2)")
                            .font(.subheadline)
                        Text("Награда: \(reward2)")
                            .font(.headline)
                        Image(systemName: model.rewards2 ? "checkmark.square.fill" : "square")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                    }
                }
                HStack {
                    Image("achivments")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text(title3)
                            .font(.headline)
                        Text("Условие: \(condition3)")
                            .font(.subheadline)
                        Text("Награда: \(reward3)")
                            .font(.headline)
                        Image(systemName: model.rewards3 ? "checkmark.square.fill" : "square")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                    }
                }
            }
            .alert("Промокод на сикдку: 0606", isPresented: $showingAlert) {}
        }
    }
}



#Preview {
    AchievementsView()
}
