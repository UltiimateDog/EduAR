//
//  questionView.swift
//  quizApp
//
//  Created by Rod Espiritu Berra on 27/11/23.
//

import SwiftUI

struct Question: Identifiable{
    let id = UUID()
    let title: String
    let answer: String
    let choices: [String]
    var selection: String?
}

struct questionView: View {
    @Binding var question : Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)
            
                //.padding(.bottom)
            ForEach(question.choices, id:\.self) { choice in
                HStack {
                    Button {
                        question.selection = choice
                    } label: {
                        if question.selection == choice {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("AppColor"))
                        } else {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                    Text(choice)
                }
                .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.horizontal, 20)
        .frame(minWidth: 340, idealWidth: 350)
        .frame(width: .infinity, height: 550, alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(uiColor: .label) .opacity(0.2), radius: 15)
       
    }   
}

struct questionView_Previews: PreviewProvider {
    static var previews: some View{
        questionView(question: .constant(Question(title: "preguntas a realizar", answer: "respuesta", choices: ["A", "B", "C", "D"], selection: nil)))
    }
}
