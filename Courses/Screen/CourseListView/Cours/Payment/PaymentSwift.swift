//
//  PaymentSwift.swift
//  Courses
//
//  Created by Никита Мартьянов on 6.03.24.
//

import SwiftUI

struct PaymentSwift: View {
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    @State private var promo = ""
    
    @State private var showingAlert = false
    
    @ObservedObject var payment = Model()
    
    @Environment(\.presentationMode) var presentationMode
    
    var checkPromo: Bool {
        return promo == "0606"
    }
    
    var isFormValid: Bool {
        return !cardNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cardName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !expiryDate.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !cvv.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && (cardNumber.count == 16) && (expiryDate.count == 4) && (cvv.count == 3)
    }
    
    
    
    var body: some View {
        VStack {
            TextField("Номер карты (16 цифр)", text: $cardNumber)
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
            
            TextField("Промокод(необязательно)", text: $promo)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Text(checkPromo ? "К оплате: 400 BYN(скидка 20%)" : "К оплате: 500 BYN")
            
            Button(action: {
                showingAlert = true
                payment.swiftPayment = true
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
        .alert("Оплата курса прошла успешно"
            , isPresented: $showingAlert) {
            Button("OK") {
                presentationMode.wrappedValue.dismiss()
                payment.csharpPayment = true
                payment.rewards1 = true
                payment.saveToUserDefaults()
            }
        }
    }
}

struct PaymentSwift_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSwift()
    }
}
