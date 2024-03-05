//
//  SwiftView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct SwiftView: View {
    @State private var youTubeURL: String = "https://youtu.be/WNMFljBCOP8?list=PL6724Ll8v6UhOq6Otjw-rUPFsZVmoCLFm"
    @State private var youTubeVideoID: String = ""
    @State private var validYouTubeURL = false
    @State private var showingPayment = false
    
    @ObservedObject var dataModel = TittleModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Введение в курс")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.red, .yellow]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(color: .black, radius: 5, x: 0, y: 3)
                    
                    if validYouTubeURL {
                        WebView(videoID: self.youTubeVideoID)
                            .scaledToFit()
                            .padding()
                    }
                    
                    VStack(spacing: 15) {
                        Text("Если вам понравился курс, его можно приобрести и пройти полностью")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .background(.yellow.opacity(0.2))
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Button(action: {
                            showingPayment = true
                            dataModel.swift = true
                        }) {
                            Text("Приобрести курс")
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red)
                                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                    }
                    
                    Spacer()
                }.onAppear {
                    if let videoID = self.youTubeURL.extractYoutubeID() {
                        self.youTubeURL = ""
                        self.youTubeVideoID = videoID
                        self.validYouTubeURL = true
                    } else {
                        self.youTubeURL = ""
                    }
                }
            }
            .padding(.bottom, 50)
            .background(LinearGradient(colors: [.red, .yellow], startPoint: .bottom, endPoint: .leading))
            .navigationTitle("Swift")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingPayment) {
                PaymentPython()
            }
        }
    }
}

#Preview {
    SwiftView()
}
