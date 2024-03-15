//
//  Configuration.swift
//  EduAR
//
//  Created by Ultiimate Dog on 11/10/23.
//

import SwiftUI

struct ProfileView: View {
    static private let allTitles = AllTitles()
    
    @State private var notifications = false
    @State private var animations = false
    @State private var mathProgress = 70
    @State private var chemestryProgress = 35
    @State private var biologyProgress = 95
    @State private var physicsProgress = 15
    @State private var quizzesProgress = 180
    @State private var profile = Profile(username: "Imer",
                                         currentTitle: allTitles.BiologyTitles[4],
                                         titlesPool: [allTitles.PhysicsTitles[0],
                                                      allTitles.MathTitles[3],
                                                      allTitles.GeneralTitles[2],
                                                      allTitles.ChemestryTitles[1],
                                                      allTitles.BiologyTitles[4]])
    
    var body: some View {
        ScrollView {
            //Apartado del nombre de usuario
            HStack {
                Text("Nombre de usuario").bold()
                Divider()
                TextField("Nombre de usuario", text: $profile.username)
            }
            
            //Apartado del titulo
            
            Divider()
            HStack {
                Text("Titulo").bold()
                Divider()
                HStack {
                    Image(systemName: profile.currentTitle.icon)
                    Text(profile.currentTitle.title)
                }
                    .contextMenu {
                        ForEach(profile.titlesPool) {titleT in
                            Button {
                                profile.currentTitle = titleT
                            } label: {
                                Label(titleT.title, systemImage: titleT.icon)
                            }
                        }
                    }
            }
            Divider()
            //Apartado de las notificaciones
            Toggle(isOn: $notifications) {
                Text("Permitir Notificaciones").bold()
            }
            .padding(.horizontal, 10)
            Divider()
            
            //Apartado de las animaciones
            Toggle(isOn: $animations) {
                Text("Activar animaciones").bold()
            }
            .padding(.horizontal, 10)
            Divider()
            
            //Apartado de los progesos
            Text("General \t\(mathProgress+biologyProgress+chemestryProgress+physicsProgress) / 400").bold()
            HStack {
                ProgressView(value: Double(mathProgress+biologyProgress+chemestryProgress+physicsProgress)/400)
                    .tint(.yellow)
                Image(systemName: profile.titlesPool[2].icon)
            }
            
            Text("Matematicas \t\(mathProgress) / 100").bold()
            HStack {
                ProgressView(value: Double(mathProgress)/100)
                    .tint(.red)
                Image(systemName: profile.titlesPool[1].icon)
            }
            
            Text("Quimica \t\(chemestryProgress) / 100").bold()
            HStack {
                ProgressView(value: Double(chemestryProgress)/100)
                    .tint(.green)
                Image(systemName: profile.titlesPool[3].icon)
            }
            
            Text("Biologia \t\(biologyProgress) / 100").bold()
            HStack {
                ProgressView(value: Double(biologyProgress)/100)
                    .tint(.cyan)
                Image(systemName: profile.titlesPool[4].icon)
            }
            
            Text("Fisica \t\(physicsProgress) / 100").bold()
            HStack {
                ProgressView(value: Double(physicsProgress)/100)
                    .tint(.purple)
                Image(systemName: profile.titlesPool[0].icon)
            }
            Divider()
            
            //Progreso Quizzes
            Text("Quizzes \t\(quizzesProgress) / 350").bold()
            HStack {
                ProgressView(value: Double(quizzesProgress)/350)
                    .tint(.orange)
                Image(systemName: profile.titlesPool[2].icon)
            }
        }
        .frame(width: .infinity)
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
