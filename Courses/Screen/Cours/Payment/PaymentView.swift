//
//  PaymentView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct PaymentView: View {
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = ""
    @State private var cvv = ""

    var isFormValid: Bool {
        return !cardNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
               !cardName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
               !expiryDate.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
               !cvv.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
                
                TextField("CVV", text: $cvv)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button(action: {
             
            }) {
                Text("Pay Now")
                    .padding()
                    .foregroundColor(.white)
                    .background(isFormValid ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
            .padding()
            .disabled(!isFormValid)
        }
        .padding()
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
