//
//  TiroParabolico.swift
//  EduAR
//
//  Created by Ultiimate Dog on 28/11/23.
//

import SwiftUI

struct TiroParabolico: View {
    private let colorPalette = ColorPalette()
    
    @State var wish2 = false
    @State var startQuiz = false
    
    var body: some View {
                
        let TiroP = InfoIdentitfier(id: 0,
                                    title: "Tiro parabolicó",
                                    subTitle: nil,
                                    information: "Como su nombre lo indica, el tiro parabólico es el movimiento que realiza un cuerpo siguiendo la trayectoria de una parábola. Este tipo de movimiento se da cuando el objeto solamente es acelerado por la gravedad (g). Un objeto que se mueve a lo largo de la parábola, tanto su altura como su desplazamiento horizontal va cambiando, por lo tanto este movimiento se realiza en 2 ejes coordenados. Además el objeto en cada punto de su trayectoria lleva una cierta velocidad, esta velocidad al ser una cantidad vectorial, podemos descomponerla en su componente horizontal y su componente vertical.",
                                    visuals: [Image("tiroP")])
        let ejeX = InfoIdentitfier(id: 1,
                                     title: nil,
                                     subTitle: "Movimiento en X",
                                     information: "Como no hay aceleración, significa que la velocidad del objeto es constante, por lo tanto",
                                     visuals: [Image("ejeX")])
        let ejeY = InfoIdentitfier(id: 2,
                                        title: nil,
                                        subTitle: "Movimiento en Y",
                                        information: "En este caso si hay aceleración, la de la gravedad, por lo que las ecuaciones que usaremos para la caída libre son",
                                        visuals: [Image("ejeY")])
        let testArray = [TiroP, ejeX, ejeY]
        
        let AR_Info = InfoIdentitfier(id: 20,
                                      title: "AR Sistema Oseo",
                                      subTitle: nil,
                                      information: "",
                                      visuals: nil)
        
        let Quiz_Info = InfoIdentitfier(id: 21,
                                        title: "Quiz",
                                        subTitle: nil,
                                        information: "El siguiente quiz constara de 10 preguntas aleatorias de un banco de preguntas",
                                        visuals: nil)
        
        let Glosario_Info = InfoIdentitfier(id: 22,
                                            title: "Glosario",
                                            subTitle: nil,
                                            information: "",
                                            visuals: nil)
        
        let indexArray = [TiroP, ejeX, ejeY, AR_Info, Quiz_Info, Glosario_Info]
        
        //Filtra la informacion que tiene titulo y por consiguiente indice
        var filteredInfo: [InfoIdentitfier] {
            indexArray.filter { array in
                (array.title != nil)
            }
        }
                
        /*
         ForEach(filteredInfo) { filtrado in
            indexes.append(IndexIdentifier(id: filtrado.id, indexTitle: filtrado.title!))
        }
         */
        
        GeometryReader { proxy in
            let deviceWidth = proxy.size.width
            let deviceHeight = proxy.size.height

            ScrollViewReader { value in
                NavigationStack { //Este navigationStack es necesario para el AR y el quiz
                    ZStack {
                        // Aqui inicia el fondo del scroll view
                        
                        fisicaIcon(wish2: wish2)

                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.PhysicsColors[4], .clear], startPoint: .top, endPoint: .bottom))
                            .ignoresSafeArea()
                        
                        //Rectangulo exterior
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorPalette.PhysicsColors[0])
                            .frame(width: deviceWidth * 0.87 > 800 ? 800 : deviceWidth * 0.87,
                                   height: deviceHeight * 0.934 > 1_200 ? 1_200 : deviceHeight * 0.934)
                            .padding(.top, deviceWidth * 0.08)
                        
                        //Rectangulo interior
                        RoundedRectangle(cornerRadius: 22)
                            .fill(.white)
                            .frame(width: deviceWidth * 0.87 > 800 ? 750 : deviceWidth * 0.87 - deviceWidth * 0.055,
                                   height: deviceHeight * 0.934 > 1_200 ? 1_150 : deviceHeight * 0.934 - deviceWidth * 0.055)
                            .padding(.top, deviceWidth * 0.08)
                        
                        // Aqui termina el fondo del scroll view
                        
                        ScrollView(showsIndicators: false) {
                            // Crea la informacion normal del documento
                            ForEach(testArray) { prueba in
                                InformationDisplayer(title: prueba.title,
                                                     subTitle: prueba.subTitle,
                                                     information: prueba.information,
                                                     visuals: prueba.visuals,
                                                     largeDevice: deviceWidth > 800)
                                .id(prueba.id)
                            }
                            
                            // AR begin
                            InformationDisplayer(title: AR_Info.title,
                                                 subTitle: AR_Info.subTitle,
                                                 information: AR_Info.information,
                                                 visuals: AR_Info.visuals,
                                                 largeDevice:  deviceWidth > 800)
                            .id(AR_Info.id)
                            
                            NavigationLink {
                                ZStack {
                                    ARskullTable()
                                        .navigationBarBackButtonHidden(true)
                                        .ignoresSafeArea()
                                        
                                    BackButton(deviceWidth: deviceWidth,
                                               deviceHeight: deviceHeight,
                                               colorButton: colorPalette.PhysicsColors[0])
                                }
                            } label: {
                                SubjectButton(buttonWidth: deviceWidth,
                                              buttonHeight: deviceHeight,
                                              subject: "Tiro parabolicó AR",
                                              buttonColor: colorPalette.PhysicsColors[2])
                            }
                           
                            // AR end
                            
                            // Quiz begin
                            InformationDisplayer(title: Quiz_Info.title,
                                                 subTitle: Quiz_Info.subTitle,
                                                 information: Quiz_Info.information,
                                                 visuals: Quiz_Info.visuals,
                                                 largeDevice:  deviceWidth > 800)
                            .id(Quiz_Info.id)
                            
                            Button {
                                self.startQuiz.toggle()
                            } label: {
                                SubjectButton(buttonWidth: deviceWidth,
                                              buttonHeight: deviceHeight,
                                              subject: "Iniciar",
                                              buttonColor: colorPalette.PhysicsColors[2])
                            }
                            .sheet(isPresented: $startQuiz) {
                                quizView()
                            }
                            // Quiz end
                            
                            // Glosario begin
                            InformationDisplayer(title: Glosario_Info.title,
                                                 subTitle: Glosario_Info.subTitle,
                                                 information: Glosario_Info.information,
                                                 visuals: Glosario_Info.visuals,
                                                 largeDevice:  deviceWidth > 800)
                            .id(Glosario_Info.id)
                            
                            Text(" **Abducción** : Movimiento que aleja el eje de la extremidad de la línea media del cuerpo.\n **Aditus Laringeo** : Abertura superior de la laringe, que comunica con la faringe.\n **Aducción** : Movimiento que acerca el eje a la extremidad a la línea media del cuerpo.\n **Agujero de Conjunción** : Orificio formado por la superposición de los  pedículos de las vértebras. \n **Anfiartrosis** : Articulación semimóvil. \n **Apófisis** : Prominencia ósea. \n **Apófisis Mastoides** : Prominencia ósea ubicada en el hueso temporal que adopta la forma de una mama. \n **Artrodia** : Articulación móvil o sinovial cuyas superficies articulares son planas. \n  **Bifurcación** : División en dos ramas de igual magnitud. \n **Bisagra**: Articulación sinovial cuyas superficies articulares establecen un tipo de movimientos en un sólo eje como lo hace una  bisagra. \n **Cáliz (Cálices)** : Conducto corto, infundibuliforme o en forma de embudo, formado por musculatura lisa, tapizado internamente por epitelio de transición. \n **Capa Serosa** : Membrana de tejido epitelial, que contiene glándulas serosas, que cubre la superficie de ciertos  órganos toráxicos y abdominales.")
                            // Glosario end
                            
                        } //Final ScrollView
                        // Estas lineas le dan estilo al fondo del scrollView
                        .frame(width: deviceWidth * 0.87 > 800 ? 730 : deviceWidth * 0.87 - deviceWidth * 0.08,
                               height: deviceHeight * 0.934 > 1_200 ? 1_150 : deviceHeight * 0.934 - deviceWidth * 0.07)
                        .padding(.top, deviceWidth * 0.08)
                        
                        //Crea el boton de los indices
                        IndexButton(value: value,
                                    ids: filteredInfo,
                                    deviceWidth: deviceWidth,
                                    deviceHeight: deviceHeight,
                                    indexColor: colorPalette.PhysicsColors[0])
                        
                        //Crea el boton de regreso
                        BackButton(deviceWidth: deviceWidth,
                                   deviceHeight: deviceHeight,
                                   colorButton: colorPalette.PhysicsColors[0])
                    } //Final ZStack
                } //Final navigationStack
            } //Final ScrollViewReader
        } //Final GeometryReader
        .navigationBarBackButtonHidden(true) //Oculta el boton de regreso normal
    }
}

#Preview {
    TiroParabolico()
}
