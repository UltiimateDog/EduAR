//
//  SistemaOseo.swift
//  EduAR
//
//  Created by Ultiimate Dog on 23/10/23.
//
import SwiftUI

struct SistemaOseo: View {
    private let colorPalette = ColorPalette()
    
    @State var wish = false
    @State var startQuiz = false

    var body: some View {
                
        let Hueso = InfoIdentitfier(id: 0,
                                    title: "Sistema Oseo",
                                    subTitle: "Esqueleto Humano",
                                    information: "Hay 5 tipos de huesos en el esqueleto: largo, corto, plano, irregular y sesamoideo. Los huesos se componen de una capa exterior de tejido óseo compacto que rodea un tejido óseo esponjoso en el interior. \nFunción: Los huesos del esqueleto apendicular soportan y facilitan el movimiento, mientras que los huesos del esqueleto axial protegen los órganos internos. El esqueleto también almacena minerales como el calcio y produce glóbulos rojos.",
                                    visuals: [Image("hueso")])
        let Medula = InfoIdentitfier(id: 1,
                                     title: nil,
                                     subTitle: "Medula Osea",
                                     information: "La médula ósea llena las cavidades cilíndricas de los cuerpos de los huesos largos y ocupa los espacios dentro del hueso esponjoso. También se extiende dentro de los canales óseos más grandes (canales centrales) que contienen vasos sanguíneos. \nFunción: La médula ósea amarilla se encuentra en las cavidades centrales de los huesos largos y consta, en su mayor parte, de grasa. La médula ósea roja se encuentra en las cavidades medulares de los huesos planos y cortos, los extremos articulares de los huesos largos, los cuerpos vertebrales, el hueso esponjoso del cráneo, el esternón, la escápula y las costillas. La médula ósea roja consiste, en su mayor parte, de tejido hematopoyético, con una pequeña cantidad de grasa. Es esencial para la producción de glóbulos rojos y contiene más células de la médula ósea, o mielocitos, que la médula ósea amarilla.",
                                     visuals: [Image("medula")])
        let Ligamento = InfoIdentitfier(id: 2,
                                        title: nil,
                                        subTitle: "Ligamento",
                                        information: "Los ligamentos son bandas de tejido conectivo denso y fibroso que son clave para la función de las articulaciones. \nFunción: Las articulaciones sinoviales con frecuencia están soportadas y reforzadas por ligamentos que la rodean, que limitan el movimiento para prevenir lesiones. Una sindesmosis es una articulación en la que un ligamento conecta dos huesos, lo que permite un pequeño movimiento (anfiartrosis).",
                                        visuals: [Image("ligamento")])
        let Craneo = InfoIdentitfier(id: 3,
                                     title: "Craneo",
                                     subTitle: nil,
                                     information: "Los huesos del cráneo y la cara abarcan la mayoría de los huesos de la región de la cabeza; se dividen en dos partes: los ocho huesos del neurocráneo y los catorce huesos del esqueleto facial. \nFunción: El cráneo (neurocráneo) incluye los huesos de la cabeza que encierran y protegen el cerebro. Los huesos faciales incluyen todos los huesos ubicados en la porción anterior de la estructura ósea de la cabeza que conforman el esqueleto facial. Estos huesos dan forma a la cara; sostienen los órganos primarios del olfato, el gusto y la vista, y están moldeados y unidos de una manera que deja aberturas para los sistemas respiratorio y digestivo.",
                                     visuals: [Image("cartilago")])
        let testArray = [Hueso, Medula, Ligamento, Craneo]
        
        let AR_Info = InfoIdentitfier(id: 20,
                                      title: "AR Sistema Oseo",
                                      subTitle: nil,
                                      information: "",
                                      visuals: nil)
        
        let Quiz_Info = InfoIdentitfier(id: 21,
                                        title: "Quiz",
                                        subTitle: nil,
                                        information: "",
                                        visuals: nil)
        
        let Glosario_Info = InfoIdentitfier(id: 22,
                                            title: "Glosario",
                                            subTitle: nil,
                                            information: "",
                                            visuals: nil)
        
        let indexArray = [Hueso, Medula, Ligamento, Craneo, AR_Info, Quiz_Info, Glosario_Info]
        
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
                        
                        EmitterViewIcon(wish: $wish)
                        
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [colorPalette.BiologyColors[4], .clear], startPoint: .top, endPoint: .bottom))
                            .ignoresSafeArea()
                        
                        //Rectangulo exterior
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorPalette.BiologyColors[0])
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
                                               colorButton: colorPalette.BiologyColors[0])
                                }
                            } label: {
                                SubjectButton(buttonWidth: deviceWidth,
                                              buttonHeight: deviceHeight,
                                              subject: "Craneo AR",
                                              buttonColor: colorPalette.BiologyColors[2])
                            }
                            
                            NavigationLink {
                                ZStack {
                                    ARskullFace()
                                        .navigationBarBackButtonHidden(true)
                                        .ignoresSafeArea()
                                        
                                    BackButton(deviceWidth: deviceWidth,
                                               deviceHeight: deviceHeight,
                                               colorButton: colorPalette.BiologyColors[0])
                                }
                            } label: {
                                SubjectButton(buttonWidth: deviceWidth,
                                              buttonHeight: deviceHeight,
                                              subject: "Craneo en rostro AR",
                                              buttonColor: colorPalette.BiologyColors[2])
                            }
                            
                            NavigationLink {
                                ZStack {
                                    ARskeleton()
                                        .navigationBarBackButtonHidden(true)
                                        .ignoresSafeArea()
                                        
                                    BackButton(deviceWidth: deviceWidth,
                                               deviceHeight: deviceHeight,
                                               colorButton: colorPalette.BiologyColors[0])
                                }
                            } label: {
                                SubjectButton(buttonWidth: deviceWidth,
                                              buttonHeight: deviceHeight,
                                              subject: "Esqueleto AR",
                                              buttonColor: colorPalette.BiologyColors[2])
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
                                              buttonColor: colorPalette.BiologyColors[2])
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
                                    indexColor: colorPalette.BiologyColors[0])
                        
                        //Crea el boton de regreso
                        BackButton(deviceWidth: deviceWidth,
                                   deviceHeight: deviceHeight,
                                   colorButton: colorPalette.BiologyColors[0])
                    } //Final ZStack
                } //Final navigationStack
            } //Final ScrollViewReader
        } //Final GeometryReader
        .navigationBarBackButtonHidden(true) //Oculta el boton de regreso normal
    }
}

struct SistemaOseo_Previews: PreviewProvider {
    static var previews: some View {
        SistemaOseo()
    }
}
