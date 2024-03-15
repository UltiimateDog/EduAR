//
//  Home.swift
//  EduAR
//
//  Created by Ultiimate Dog on 10/10/23.
//

import SwiftUI

struct Home: View {
    private let colorPalette = ColorPalette()
    
    var body: some View {
        //El GeometryReader es necesario para obtener el tamaño del dispotivo utilizado
        GeometryReader { proxy in
            let deviceWidth = proxy.size.width //Ancho del dispositivo
            let deviceHeight = proxy.size.height //Largo del dispositivo
                        
            NavigationStack {
                ZStack {
                    //Crea el stack para el fondo
                    animationBackground()
                    
                    //Este es el Hstack que se encarga de poner los colores en el fondo
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.MathColors[0], .clear], startPoint: .top, endPoint: .init(x: 0, y: 0.8)))
                            .ignoresSafeArea()
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.ChemistryColors[0], .clear], startPoint: .top, endPoint: .init(x: 0, y: 0.8)))
                            .ignoresSafeArea()
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.BiologyColors[0], .clear], startPoint: .top, endPoint: .init(x: 0, y: 0.8)))
                            .ignoresSafeArea()
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.PhysicsColors[0], .clear], startPoint: .top, endPoint: .init(x: 0, y: 0.8)))
                            .ignoresSafeArea()
                    }
                    
                    //Crea el stack para los botones
                    VStack(spacing: 0) {
                        //Crea el link a la respectiva view
                        NavigationLink {
                            Maths()
                        } label:  {
                            //Crea el boton para el link
                            HomeButton( buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        science: "Matematicas",
                                        buttonColor: colorPalette.MathColors[0])
                        }
                        
                        NavigationLink {
                            Chemistry()
                        } label: {
                            HomeButton( buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        science: "Quimica",
                                        buttonColor: colorPalette.ChemistryColors[0])
                        }
                        
                        NavigationLink {
                            Biology()
                        } label:  {
                            HomeButton( buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        science: "Biologia",
                                        buttonColor: colorPalette.BiologyColors[0])
                        }
                        
                        NavigationLink {
                            Physics()
                        } label:  {
                            HomeButton( buttonWidth: deviceWidth,
                                        buttonHeight: deviceHeight,
                                        science: "Fisica",
                                        buttonColor: colorPalette.PhysicsColors[0])
                        }
                    }
                    
                 ProfileButton(deviceWidth: deviceWidth, deviceHeight: deviceHeight)

                } //Final ZStack
            }
        } //Final GeometryReader
    }
}

// Estas lineas de codigo se encargan de poder regresar con un slide
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
// Aqui terminan las lineas

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
