//
//  PaymentJava.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct PaymentJava: View {
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    
    @State private var showingAlert = false
    
    @ObservedObject var payment = Model()
    
    var isFormValid: Bool {
        return !cardNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cardName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !expiryDate.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cvv.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && (cardNumber.count == 16) && (expiryDate.count == 5) && (cvv.count == 3)
    }
    
    
    
    var body: some View {
        VStack {
            TextField("Номер карты", text: $cardNumber)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Имя держателя карты", text: $cardName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            HStack {
                TextField("MM YY", text: $expiryDate)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                TextField("CVV", text: $cvv)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            
            Text("К оплате: 500 BYN")
            
            Button(action: {
                showingAlert = true
                payment.javaPayment = true
            }) {
                Text("Оплатить")
                    .padding()
                    .foregroundColor(.white)
                    .background(isFormValid ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
            .padding()
            .disabled(!isFormValid)
        }
        .padding()
        .alert("""
               
               Оплата курса прошла успешно
               Перезайдите в приложение чтобы начать проходить данный курс
               
               """, isPresented: $showingAlert) {
            Button("OK") {
                payment.javaPayment = true
                payment.saveToUserDefaults()
            }
        }
    }
}

struct PaymentJava_Previews: PreviewProvider {
    static var previews: some View {
        PaymentJava()
    }
}
