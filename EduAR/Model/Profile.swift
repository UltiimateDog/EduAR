//
//  Profile.swift
//  EduAR
//
//  Created by Ultiimate Dog on 25/11/23.
//

import Foundation
import SwiftUI

struct Profile {
    init(username: String, currentTitle: TitleFormat, titlesPool: [TitleFormat]) {
        self.username = username
        self.currentTitle = currentTitle
        self.titlesPool = titlesPool
    }
    
    var username: String
    var currentTitle: TitleFormat
    var titlesPool: [TitleFormat]
    
}

struct TitleFormat: Identifiable {
    let title: String
    let icon: String
    var id: String { title }
}

struct AllTitles {
    let MathTitles = [TitleFormat(title: "Interesado en Mates", icon: "person.fill.questionmark"),
                      TitleFormat(title: "Novato en Mates", icon: "pencil.and.ruler.fill"),
                      TitleFormat(title: "Aprendiz en Mates", icon: "studentdesk"),
                      TitleFormat(title: "Conocedor de Mates", icon: "graduationcap.fill"),
                      TitleFormat(title: "Maestro en Mates", icon: "books.vertical.fill") ]
    
    let BiologyTitles = [TitleFormat(title: "Interesado en Biologia", icon: "person.fill.questionmark"),
                      TitleFormat(title: "Novato en Biologia", icon: "pencil.and.ruler.fill"),
                      TitleFormat(title: "Aprendiz en Biologia", icon: "studentdesk"),
                      TitleFormat(title: "Conocedor de Biologia", icon: "graduationcap.fill"),
                      TitleFormat(title: "Maestro en Biologia", icon: "books.vertical.fill") ]
    
    let ChemestryTitles = [TitleFormat(title: "Interesado en Quimica", icon: "person.fill.questionmark"),
                      TitleFormat(title: "Novato en Quimica", icon: "pencil.and.ruler.fill"),
                      TitleFormat(title: "Aprendiz en Quimica", icon: "studentdesk"),
                      TitleFormat(title: "Conocedor de Quimica", icon: "graduationcap.fill"),
                      TitleFormat(title: "Maestro en Quimica", icon: "books.vertical.fill") ]
    
    let PhysicsTitles = [TitleFormat(title: "Interesado en Fisica", icon: "person.fill.questionmark"),
                      TitleFormat(title: "Novato en Fisica", icon: "pencil.and.ruler.fill"),
                      TitleFormat(title: "Aprendiz en Fisica", icon: "studentdesk"),
                      TitleFormat(title: "Conocedor de Fisica", icon: "graduationcap.fill"),
                      TitleFormat(title: "Maestro en Fisica", icon: "books.vertical.fill") ]
    
    let GeneralTitles = [TitleFormat(title: "Interesado en Ciencias", icon: "person.fill.questionmark"),
                      TitleFormat(title: "Novato en Ciencias", icon: "pencil.and.ruler.fill"),
                      TitleFormat(title: "Aprendiz en Ciencias", icon: "studentdesk"),
                      TitleFormat(title: "Conocedor de Ciencias", icon: "graduationcap.fill"),
                      TitleFormat(title: "Maestro de Ciencias", icon: "books.vertical.fill") ]
}
