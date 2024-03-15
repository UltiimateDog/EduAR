//
//  Chemestry.swift
//  EduAR
//
//  Created by Ultiimate Dog on 10/10/23.
//

import SwiftUI

struct Chemistry: View {
    private var subjects = ["",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            ""
                            ]
    private let colorPalette = ColorPalette()
    
    var body: some View {
        GeometryReader { proxy in
            let deviceWidth = proxy.size.width
            let deviceHeight = proxy.size.height
                
            BackButton(deviceWidth: deviceWidth,
                       deviceHeight: deviceHeight,
                       colorButton: colorPalette.ChemistryColors[0])
                
            NavigationStack {
                //Se encarga de poner todos los botones
                ScrollView(showsIndicators: false) {
                    NavigationLink {
                        OperacionesBasicas()
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[0],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[1],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                        
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[2],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                    
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[3],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[4],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[5],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[6],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[7],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[8],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }

                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[9],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                        
                    NavigationLink {
                            
                    } label: {
                        SubjectButton(buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        subject: subjects[10],
                                        buttonColor: colorPalette.ChemistryColors[1])
                    }
                    
                } //Final ScrollView
                .frame(width: deviceWidth, height: deviceHeight,alignment: .center)
                .padding(.top, deviceWidth * 0.1 > 70 ? 70 : deviceWidth * 0.1)
            } //Final NavigationStack
        } //Final Geometry Reader
        .navigationBarBackButtonHidden(true) //Oculta el boton de regreso normal
    }
}

struct Chemestry_Previews: PreviewProvider {
    static var previews: some View {
        Chemistry()
    }
}
