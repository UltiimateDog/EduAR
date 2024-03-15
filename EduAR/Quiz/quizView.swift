//
//  ContentView.swift
//  quizApp
//
//  Created by Rod Espiritu Berra on 27/11/23.
//

import SwiftUI

class QuizManager: ObservableObject {
    @Published var mockQuestions = [
        Question(title:"¿Cuál de los siguientes huesos NO es parte del cráneo?", answer: "respuesta", choices: ["A) Hueso frontal", "B) Hueso parietal", "C) Hueso esternón", "D) Hueso occipital"]),
        Question(title:"¿Cuántos huesos conforman el cráneo humano en un adulto?", answer: "respuesta2", choices: ["A) 22", "B) 28", "C) 30", "D) 32"]),
        Question(title:"¿Qué hueso es el más largo del cuerpo humano?", answer: "respuesta3", choices: ["A) Húmero", "B) Fémur", "C) Tibia", "D) Peroné"])
        
    ]
    
    func seEnvia() -> Bool {
        return mockQuestions.filter({ $0.selection == nil}).isEmpty
    }
    
    func califQuiz() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions{
            if question.answer == question.selection{
                correct += 1
            }
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100) %"
    }
    
    struct QuizResults {
        let correct: Int
        let total: Int
        let grade: String
    }
}

struct quizView: View {
    @StateObject var manager = QuizManager()
    @State var showStart = false
    @State var showResults = false
    
    var body: some View {
        TabView{
            
            ForEach(manager.mockQuestions.indices, id: \.self){ index in
                VStack{
                    Spacer()
                    questionView(question: $manager.mockQuestions[index])
                    Spacer()
                    if let lastQuestion = manager.mockQuestions.last, lastQuestion.id == manager.mockQuestions[index].id {
        
                        Button{
                            showResults = true
                        } label: {
                            Text("Enviar")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color("AppColor"))
                                    .frame(width: 340)
                            )
                            
                        }
                        .buttonStyle(.plain)
                        .disabled(!manager.seEnvia())
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .fullScreenCover(isPresented: $showStart){
            StartView()
        }
        .fullScreenCover(isPresented: $showResults){
            ResultsView(result: .init(correct: 8, total: 10, grade: "80%"))
            
        }
    }
}

struct quizView_Previews: PreviewProvider {
    static var previews: some View{
        quizView()
    }
}

