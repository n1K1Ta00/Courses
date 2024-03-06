//
//  InfoView.swift
//  Courses
//
//  Created by Никита Мартьянов on 4.03.24.
//

import SwiftUI

struct CourseListView: View {
    enum CourseType: Identifiable {
        case python
        case swift
        case kotlin
        case java
        case cSharp
        
        var id: String {
            switch self {
            case .python: return "python"
            case .swift: return "swift"
            case .kotlin: return "kotlin"
            case .java: return "java"
            case .cSharp: return "cSharp"
            }
        }
    }
    
    @State private var selectedCourseType: CourseType?
    @State private var search = ""
    @ObservedObject var payment = Model()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    SearchBarView(searchText: $search)
                        .padding()
                    
                    ForEach(courses.filter {
                        search.isEmpty || $0.title.localizedCaseInsensitiveContains(search)
                    })  { course in
                        NavigationLink(
                            destination: getViewForCourse(course.type).navigationBarBackButtonHidden(true),
                            tag: course.type,
                            selection: $selectedCourseType
                        ) {
                            CoursItemView(title: course.title, imageURL: course.imageURL, amount: course.amount, footerText: course.footerText)
                        }
                    }
                }
            }
            .padding(.bottom, 50)
        }
    }
    
    func getViewForCourse(_ courseType: CourseType) -> some View {
        switch courseType {
        case .python:
            if payment.pythonPayment == true {
                return AnyView(PythonCourse())
            }
            return AnyView(PythonView())
        case .swift:
            if payment.swiftPayment == true {
                return AnyView(SwiftCourse())
            }
            return AnyView(SwiftView())
        case .kotlin:
            if payment.kotlinPayment == true {
                return AnyView(KotlinCourse())
            }
            return AnyView(KotlinView())
        case .java:
            if payment.javaPayment {
                return AnyView(JavaCourse())
            }
            return AnyView(JavaView())
        case .cSharp:
            if payment.csharpPayment == true {
                return AnyView(CSharpCourse())
            }
            return AnyView(CSharpView())
        }
    }
    
    struct Course: Identifiable {
        let id = UUID()
        var type: CourseType
        var title: String
        var imageURL: String
        var amount: Double
        var footerText: String
    }
    
    let courses = [
        Course(type: .python, title: "Python", imageURL: "https://i.imgur.com/eoUVtjn.png", amount: 500, footerText: "IT Progger"),
        Course(type: .swift, title: "Swift", imageURL: "https://avatars.dzeninfra.ru/get-zen_doc/5175112/pub_5ee0eafd4121087f382930d5_62e2567fefd3e21b6e6b653f/scale_1200", amount: 500, footerText: "Alex Skutarenko"),
        Course(type: .kotlin, title: "Kotlin", imageURL: "https://i.pinimg.com/originals/14/d6/a4/14d6a492bb72de48cebcd53c9b98907f.png", amount: 500, footerText: "Гоша Дударь"),
        Course(type: .java, title: "Java", imageURL: "https://new-science.ru/wp-content/uploads/2022/06/355-1.png", amount: 500, footerText: "IT Progger"),
        Course(type: .cSharp, title: "C#", imageURL: "https://habrastorage.org/webt/21/_h/u6/21_hu6mi0r6toeblz3tnufvlipo.jpeg", amount: 500, footerText: "SimpleCode")
    ]
}


#Preview {
    CourseListView()
}
