import SwiftUI

struct QuizResults {
    var correct: Int
    var total: Int
    var grade: String
}

struct ResultsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var result: QuizResults
    
    var body: some View {
        VStack{
            Text("Resultado")
                .font(.system(size: 64))
            Text("")
                .font(.system(size: 36))
            
            Text("\(result.correct) de \(result.total)" )
                .font(.system(size: 36))
            
            Text(result.grade)
                .font(.system(size: 24))
            Button{
                dismiss()
            } label: {
            
                Text("Retomar el cuestionario")
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

struct ResultsView_Previews: PreviewProvider{
    static var previews: some View{
        ResultsView(result: .init(correct: 8, total: 10, grade: "80%"))
    }
}

