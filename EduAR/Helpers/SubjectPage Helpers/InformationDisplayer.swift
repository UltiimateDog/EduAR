//
//  InformationDisplayer.swift
//  EduAR
//
//  Created by Ultiimate Dog on 24/10/23.
//

import SwiftUI

//InfoIdentifier permite tener una base para cada parte que contenga informacion de las paginas,
//InfoIdentifier solo sera utilizado en las primeras partes de la view, para las siguientes se utilizaran otras
struct InfoIdentitfier: Identifiable {
    init(id: Int, title: String?, subTitle: String?, information: String, visuals: [Image]?) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.information = information
        self.visuals = visuals
    }
    let id: Int
    let title: String?
    let subTitle: String?
    let information: String
    let visuals: [Image]?
}

struct InformationDisplayer: View {
    let title: String?
    let subTitle: String?
    let information: String
    let visuals: [Image]?
    let largeDevice: Bool
        
    var body: some View {
        //Checa si el titulo existe, y si es que existe lo crea
        if title != nil {
            Text(title ?? "")
                .font(.title)
                .fontWeight(.heavy)
        }
        
        //Checa si el subtitulo existe, y si es que existe lo crea
        if subTitle != nil {
            Text("  " + (subTitle ?? ""))
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        //Crea toda la informacion en el documento
        Text(information)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        //Checa si las imagenes existen, y si es que existen las crea
        if visuals != nil {
            let visualsNumber = visuals?.count
            
            //Checa si el dispositivo es grande y si es que lo es, modifica como se colocan las imagenes
            if largeDevice {
                //Redonde hacia abajo el numero de imagenes
                let roundedValue = (visualsNumber! % 2 == 1) ? (visualsNumber! - 1) / 2: visualsNumber! / 2
                
                ForEach(0..<roundedValue) { i in
                    //Separa las imagenes en grupos de dos
                    HStack {
                        ForEach(i..<i+2) { a in
                            //Crea las imagenes
                            visuals![a]
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .frame(width: .infinity)
                }
                
                //Si es que el numero de imagenes es impar, crea la ultima imagen individualmente
                if visualsNumber! % 2 == 1 {
                    visuals![visualsNumber! - 1]
                        .resizable()
                        .scaledToFit()
                        .frame(width: 365)
                }
            } else {
                ForEach(0..<visualsNumber!) { i in
                    visuals![i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct InformationDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        InformationDisplayer(title: nil,
                             subTitle: nil,
                             information: "Hey",
                             visuals: nil,
                             largeDevice: false)
    }
}
