//
//  CSharpCourse.swift
//  Courses
//
//  Created by Никита Мартьянов on 5.03.24.
//

import SwiftUI

struct CSharpCourse: View {
    @State private var youTubeURL1: String = "https://youtu.be/l77oxzJUhMQ?list=PLQOaTSbfxUtD6kMmAYc8Fooqya3pjLs1N"
    @State private var youTubeVideoID1: String = ""
    @State private var validYouTubeURL1 = false
    @State private var showingPayment1 = false
    
    
    @State private var youTubeURL2: String = "https://youtu.be/JTn3m-8eMx4?list=PLQOaTSbfxUtD6kMmAYc8Fooqya3pjLs1N"
    @State private var youTubeVideoID2: String = ""
    @State private var validYouTubeURL2 = false
    @State private var showingPayment2 = false
    
    
    @State private var youTubeURL3: String = "https://youtu.be/fNjVCSEXpDM?list=PLQOaTSbfxUtD6kMmAYc8Fooqya3pjLs1N"
    @State private var youTubeVideoID3: String = ""
    @State private var validYouTubeURL3 = false
    @State private var showingPayment3 = false
    
    
    @State private var youTubeURL4: String = "https://youtu.be/JD3Ois6i298?list=PLQOaTSbfxUtD6kMmAYc8Fooqya3pjLs1N"
    @State private var youTubeVideoID4: String = ""
    @State private var validYouTubeURL4 = false
    @State private var showingPayment4 = false
    
    
    @State private var youTubeURL5: String = "https://youtu.be/Wp8hDQs3J4o?list=PLQOaTSbfxUtD6kMmAYc8Fooqya3pjLs1N"
    @State private var youTubeVideoID5: String = ""
    @State private var validYouTubeURL5 = false
    @State private var showingPayment5 = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    Image("csharp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Содержание курса")
                        .foregroundStyle(.black)
                        .font(.title)
                    
                    HStack {
                        NavigationLink("Урок №1:Первая программа") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL1 {
                                        WebView(videoID: self.youTubeVideoID1)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Text("Урок №1:Первая программа")
                                        .font(.title)
                                        .foregroundStyle(Color.black)
                                    
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
                        NavigationLink("Урок №2:Структура проекта") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL2 {
                                        WebView(videoID: self.youTubeVideoID2)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Text("Урок №2:Структура проекта")
                                        .font(.title)
                                        .foregroundStyle(Color.black)
                                    
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
                        NavigationLink("Урок №3:Типы данных в С#") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL3 {
                                        WebView(videoID: self.youTubeVideoID3)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Text("Урок №3:Типы данных в С#")
                                        .font(.title)
                                        .foregroundStyle(Color.black)
                                    
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
                        NavigationLink("Урок №4:Что такое переменная в С#") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL4 {
                                        WebView(videoID: self.youTubeVideoID4)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Text("Урок №4:Что такое переменная в С#")
                                        .font(.headline)
                                        .foregroundStyle(Color.black)
                                    
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
                        NavigationLink("Урок №5:Ввод данных в консоль в С#") {
                            ScrollView {
                                VStack {
                                    if validYouTubeURL5 {
                                        WebView(videoID: self.youTubeVideoID5)
                                            .frame(width: 380, height: 380)
                                    }
                                    
                                    Text("Урок №5:Ввод данных в консоль в С#")
                                        .font(.headline)
                                        .foregroundStyle(Color.black)
                                    
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
    CSharpCourse()
}
