//
//  Maths.swift
//  EduAR
//
//  Created by Ultiimate Dog on 10/10/23.
//

import SwiftUI

struct Maths: View {
    private var subjects = ["Operaciones Basicas",
                            "Enteros positivos y negativos",
                            "Fracciones y Decimales",
                            "Geometria basica",
                            "Algebra Basica",
                            "Proporciones y Razones",
                            "Estadistica y Graficos simples",
                            "Resolucion de Problemas Complejos",
                            "Numeros Irracionales y Radicales",
                            "Polinomios y Factorizacion",
                            "Teorema del Binomio"
                            ]
    private let colorPalette = ColorPalette()
    
    var body: some View {
        GeometryReader { proxy in
            let deviceWidth = proxy.size.width
            let deviceHeight = proxy.size.height
                
            BackButton(deviceWidth: deviceWidth,
                       deviceHeight: deviceHeight,
                       colorButton: colorPalette.MathColors[0])
                
            NavigationStack {
                //Se encarga de poner todos los botones
                ScrollView(showsIndicators: false) {
                    NavigationLink {
                        OperacionesBasicas()
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[0],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[1],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                        
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[2],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                    
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[3],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[4],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[5],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[6],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[7],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[8],
                                        buttonColor: colorPalette.MathColors[1])
                    }

                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[9],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[10],
                                        buttonColor: colorPalette.MathColors[1])
                    }
                    
                } //Final ScrollView
                .frame(width: deviceWidth, height: deviceHeight,alignment: .center)
                .padding(.top, deviceWidth * 0.1 > 70 ? 70 : deviceWidth * 0.1)
            } //Final NavigationStack
        } //Final Geometry Reader
        .navigationBarBackButtonHidden(true) //Oculta el boton de regreso normal
    }
}

struct Maths_Previews: PreviewProvider {
    static var previews: some View {
        Maths()
    }
}
