//
//  PaymentView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct PaymentPython: View {
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    
    @State private var showingAlert = false
    
    @ObservedObject var title = TittleModel()
    @ObservedObject var payment = PaymentModel()
    
    var isFormValid: Bool {
        return !cardNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cardName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !expiryDate.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cvv.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && (cardNumber.count == 16) && (expiryDate.count == 5) && (cvv.count == 3)
    }
    
    
    
    var body: some View {
        VStack {
            TextField("Card Number", text: $cardNumber)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Cardholder Name", text: $cardName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            HStack {
                TextField("MM/YY", text: $expiryDate)
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
        .alert("Оплата курса прошла успешно", isPresented: $showingAlert) {
            
        }
    }
}

struct PaymentPython_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPython()
    }
}
