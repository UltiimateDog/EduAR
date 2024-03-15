//
//  IndexButton.swift
//  EduAR
//
//  Created by Ultiimate Dog on 14/10/23.
//

import SwiftUI

// Crea una estructura para los indices, que contiene un identificado y un titulo

struct IndexButton: View {
    @State var showIndex = false
    var value: ScrollViewProxy
    let ids: [InfoIdentitfier]

    let deviceWidth: Double
    let deviceHeight: Double
    
    @State private var pressed = false
    
    let indexColor: Color
    
    var body: some View {
        // Muestra el boton si no se muestre el indice
        if !showIndex {
            // Crea el boton del indice
            Button() {
                withAnimation {
                    self.showIndex.toggle()
                }
            } label: {
                // Crea la imagen para el boton del indice
                ZStack {
                    Circle()
                        .foregroundStyle(.white)
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(indexColor)
                }
            }
            // Estas lineas se encargan de dar estilo al boton del indice
            .frame(width: deviceWidth * 0.1 > 70 ? 70 : deviceWidth * 0.1)
            .padding(.trailing, deviceWidth * 0.2 > 150 ? 150 : deviceWidth * 0.2)
            .padding(.top, deviceHeight * 0.2 > 180 ? 180 : deviceHeight * 0.2)
            .position(x: deviceWidth, y: deviceWidth * 0.2 > 150 ? -35 : 0)
            .ignoresSafeArea()
        }
        
        //Muestra el indice
        if showIndex {
            // Crea el fondo gris transparente en general
            Rectangle()
                .opacity(0.3)
                .ignoresSafeArea()
        }
         
        if showIndex {
            HStack(spacing: 0) {
                
                // Crea un boton invicible que se encarga de quitar el indice
                Button {
                    withAnimation {
                        self.showIndex.toggle()
                    }
                } label: {
                    // Hace que el boton sea invicible
                    Rectangle()
                        .fill(.clear)
                        .ignoresSafeArea()
                }
                  
                // Este es el rectangulo mas oscuro del indice
                Rectangle()
                    .opacity(0.6)
                    .frame(width: deviceWidth / 2 > 300 ? 300 : deviceWidth / 2,
                            height: .infinity)
                    .ignoresSafeArea()
                    // El overlay se encarga de poner los indices encima del rectangulo oscuro
                    .overlay (
                        // Crea la lista de botonos que conformen los indices
                        List(ids) { id in
                            // Crea los botonos dependiendo de cuantos indices hayan
                            Button {
                                value.scrollTo(id.id, anchor: .top) // Se encarga de hacer que funciones los indices
                                self.pressed.toggle() // Esto se encraga de que funcione las animaciones
                                Task {
                                    await delayAction()
                                }
                            } label: {
                                Text(id.title!)
                                    .frame(width: deviceWidth / 2 > 300 ? 300 : deviceWidth / 2,
                                           height: 50,
                                           alignment: .leading)
                            }
                            // Le da estilo a cada boton del indice
                            .frame(width: deviceWidth / 2 > 300 ? 300 : deviceWidth / 2,
                                   alignment: .leading)
                            .buttonStyle(.bordered) // Esta linea es necasaria para que los botones tengan animaciones
                            .font(deviceWidth * 0.763 > 500 ? .title : .title2)
                            .foregroundStyle(.white)
                            .bold()
                            .tint(pressed ? .black : .clear) //Se encarga de pintar los botones con su fondo correspondiente
                            .listRowSeparator(.hidden) // Se encarga de ocultar una linea toda fea en la lista
                            .listRowBackground(EmptyView()) // Se encarga de hacer que el fondo de los botones sea transparente para funcione las animaciones
                        }
                            // Estas lineas se encargan de dar un estilo a la lista que contiene los indices
                            .listRowSpacing(20)
                            .listStyle(.inset)
                            .scrollContentBackground(.hidden) // Se encarga de poner el fondo transparente para que se vea el rectangulo de fondo
                    )
            }
            // Esta linea se encarga de hacer la animacion del indice, es decir que aparezca de un lado al otro
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        } //Final if
    }
    
    // Esta funcion se encarga de retrasar la animacion de cuando le picas a un indice
    private func delayAction() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 100_000_000)
            withAnimation {
                pressed = false
            }
        }
}

struct IndexButton_Preview: PreviewProvider {
    static var previews: some View {
        let ind = InfoIdentitfier(id: 1, title: "Sample", subTitle: nil, information: "H", visuals: nil)
        let ind2 = InfoIdentitfier(id: 3, title: "Sample 2", subTitle: nil, information: "H", visuals: nil)

        ScrollViewReader { proxy in
            IndexButton(value: proxy, ids: [ind, ind2],deviceWidth: 393, deviceHeight: 759, indexColor: .red)
        }
    }
}
