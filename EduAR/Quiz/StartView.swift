//
//  StartView.swift
//  quizApp
//
//  Created by Rod Espiritu Berra on 28/11/23.
//

import SwiftUI

struct StartView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Cuestionario")
                .font(.system(size: 64))
            Text("¿Listo para realizar el cuestionario?")
                .font(.system(size: 24))
            
            Button{
                dismiss()
            } label: {
                Text("Comenzar")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("AppColor"))
                            .frame(width: 340)
                        )
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
               .padding(.bottom, 100)
               .alignmentGuide(.top, computeValue: { d in d[.top] })
    }
}

struct StartView_Preview: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
