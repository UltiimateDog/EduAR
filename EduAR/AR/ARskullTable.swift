//
//  ARskullTable.swift
//  EduAR
//
//  Created by Ultiimate Dog on 26/11/23.
//

import SwiftUI
import RealityKit
import ARKit


struct ARskullTable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some ARView {
        let arView = ARView()
        
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)

        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        //Carga el modelo para el craneo en una superficie en la App
        CraneoMesa.loadSceneAsync(completion: { (result) in
            do {
                let skullTable = try result.get()
                arView.scene.anchors.append(skullTable)
            } catch {
                print("The AR view for the skull couldn´t be loaded.")
            }
        })
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //No se usara
    }
}

struct ARskullFace: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some ARView {
        let arView = ARView()
        
        // Start AR session
        let session = arView.session
        let config = ARFaceTrackingConfiguration()
        session.run(config)

        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        //Carga la realidad aumentada para el modelo del rostro en la App
        CráneoCara.loadSceneAsync(completion: { (result) in
            do {
                let skullFace = try result.get()
                arView.scene.anchors.append(skullFace)
            } catch {
                print("The AR view for the skull in the user´s face couldn´t be loaded.")
            }
        })
                
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //No se usara
    }
}

struct ARskeleton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some ARView {
        let arView = ARView()
        
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)

        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        //Carga la realidad aumentada para el esqueleto
        Esqueleto.loadSceneAsync(completion: { (result) in
            do {
                let skeleton = try result.get()
                arView.scene.anchors.append(skeleton)
            } catch {
                print("The AR view for the skeleton couldn´t be loaded.")
            }
        })
                
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //No se usara
    }
}
