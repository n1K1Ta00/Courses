//
//  JavaCourse.swift
//  Courses
//
//  Created by Никита Мартьянов on 5.03.24.
//

import SwiftUI

struct JavaCourse: View {
    @State private var youTubeURL1: String = "https://youtu.be/-1LLzZC-9cU?list=PLDyJYA6aTY1lT614ixLYq48har7EnCXpk"
    @State private var youTubeVideoID1: String = ""
    @State private var validYouTubeURL1 = false
    @State private var showingPayment1 = false
    
    
    @State private var youTubeURL2: String = "https://youtu.be/CEMhFQZrVzw?list=PLDyJYA6aTY1lT614ixLYq48har7EnCXpk"
    @State private var youTubeVideoID2: String = ""
    @State private var validYouTubeURL2 = false
    @State private var showingPayment2 = false
    
    
    @State private var youTubeURL3: String = "https://youtu.be/mTucAnRpxcQ?list=PLDyJYA6aTY1lT614ixLYq48har7EnCXpk"
    @State private var youTubeVideoID3: String = ""
    @State private var validYouTubeURL3 = false
    @State private var showingPayment3 = false
    
    
    @State private var youTubeURL4: String = "https://youtu.be/-RXEXP4-Iic?list=PLDyJYA6aTY1lT614ixLYq48har7EnCXpk"
    @State private var youTubeVideoID4: String = ""
    @State private var validYouTubeURL4 = false
    @State private var showingPayment4 = false
    
    
    @State private var youTubeURL5: String = "https://youtu.be/SdGp-5pcPeA?list=PLDyJYA6aTY1lT614ixLYq48har7EnCXpk"
    @State private var youTubeVideoID5: String = ""
    @State private var validYouTubeURL5 = false
    @State private var showingPayment5 = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    Image("java")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Text("Содержание курса")
                        .foregroundStyle(.black)
                        .font(.title)
                    
                    HStack {
                        NavigationLink("Урок №1:Установка Java JDK и IntelliJ IDEA") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL1 {
                                        WebView(videoID: self.youTubeVideoID1)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }.onAppear {
                            if let videoID = self.youTubeURL1.extractYoutubeID() {
                                self.youTubeURL1 = ""
                                self.youTubeVideoID1 = videoID
                                self.validYouTubeURL1 = true
                            } else {
                                self.youTubeURL1 = ""
                            }
                        }
                        
                        Spacer()
                        
                    }
                    HStack {
                        NavigationLink("Урок №2:Базовые концепции языка") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL2 {
                                        WebView(videoID: self.youTubeVideoID2)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }.onAppear {
                            if let videoID = self.youTubeURL2.extractYoutubeID() {
                                self.youTubeURL2 = ""
                                self.youTubeVideoID2 = videoID
                                self.validYouTubeURL2 = true
                            } else {
                                self.youTubeURL2 = ""
                            }
                        }
                        
                        Spacer()
                        
                    }
                    HStack {
                        NavigationLink("Урок №3:Переменные в Джава. Типы данных") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL3 {
                                        WebView(videoID: self.youTubeVideoID3)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }.onAppear {
                            if let videoID = self.youTubeURL3.extractYoutubeID() {
                                self.youTubeURL3 = ""
                                self.youTubeVideoID3 = videoID
                                self.validYouTubeURL3 = true
                            } else {
                                self.youTubeURL3 = ""
                            }
                        }
                        
                        Spacer()
                        
                    }
                    HStack {
                        NavigationLink("Урок №4:Математические действия") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL4 {
                                        WebView(videoID: self.youTubeVideoID4)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }.onAppear {
                            if let videoID = self.youTubeURL4.extractYoutubeID() {
                                self.youTubeURL4 = ""
                                self.youTubeVideoID4 = videoID
                                self.validYouTubeURL4 = true
                            } else {
                                self.youTubeURL4 = ""
                            }
                        }
                        
                        Spacer()
                        
                    }
                    HStack {
                        NavigationLink("Урок №5:Условные конструкции") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL5 {
                                        WebView(videoID: self.youTubeVideoID5)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }
                        .onAppear {
                            if let videoID = self.youTubeURL5.extractYoutubeID() {
                                self.youTubeURL5 = ""
                                self.youTubeVideoID5 = videoID
                                self.validYouTubeURL5 = true
                            } else {
                                self.youTubeURL5 = ""
                            }
                        }
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                }
                .background(Color.white)
            }
        }
    }
}

#Preview {
    JavaCourse()
}
