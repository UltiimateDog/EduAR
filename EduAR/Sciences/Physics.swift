//
//  Physics.swift
//  EduAR
//
//  Created by Ultiimate Dog on 10/10/23.
//

import SwiftUI

struct Physics: View {
    private var subjects = ["Medicion y Unidades",
                            "Cinematica",
                            "Movimiento",
                            "Trabajo y energia",
                            "Electricidad",
                            "Tiro Parabolico",
                            "Ondas",
                            "Optica",
                            "Fuerza",
                            "Movimiento Circular",
                            "Campos magneticos"
                            ]
    
    private let colorPalette = ColorPalette()
    
    @State var wish2 = false
    
    var body: some View {
        GeometryReader { proxy in
            let deviceWidth = proxy.size.width
            let deviceHeight = proxy.size.height
                
            NavigationStack {
                //Se encarga de poner todos los botones
                ZStack {
                    fisicaIcon(wish2: wish2)
                    
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [colorPalette.PhysicsColors[4], .clear], startPoint: .top, endPoint: .bottom))
                        .ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        NavigationLink {
                            OperacionesBasicas()
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[0],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[1],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[2],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[3],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[4],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            TiroParabolico()
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[5],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[6],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[7],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[8],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[9],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            SubjectButton(buttonWidth: deviceWidth,
                                          buttonHeight: deviceHeight,
                                          subject: subjects[10],
                                          buttonColor: colorPalette.PhysicsColors[1])
                        }
                        
                    } //Final ScrollView
                    .frame(width: deviceWidth, height: deviceHeight,alignment: .center)
                    .padding(.top, deviceWidth * 0.1 > 70 ? 70 : deviceWidth * 0.1)
                }
            } //Final NavigationStack
            BackButton(deviceWidth: deviceWidth,
                       deviceHeight: deviceHeight,
                       colorButton: colorPalette.PhysicsColors[0])
        } //Final Geometry Reader
        .navigationBarBackButtonHidden(true) //Oculta el boton de regreso normal
    }
}

struct Physics_Previews: PreviewProvider {
    static var previews: some View {
        Physics()
    }
}
