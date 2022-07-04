//
//  ViewController.swift
//  scenekit-example
//
//  Created by Андрей Груненков on 05.07.2022.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    var sceneView: SCNView = {
        var scn = SCNView()
        scn.translatesAutoresizingMaskIntoConstraints = false
        return scn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sceneView)
        setupConstraints()
        setupSceneView()
    }

}

private extension ViewController {
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
        
    }
    
    func setupSceneView() {
        // 1: Load .obj file
        let scene = SCNScene(named: "converse_obj.obj")
        
        // 2: Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 60)
        // 4: Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)
        
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 60)
        scene?.rootNode.addChildNode(lightNode)
        
        // 6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        // If you don't want to fix manually the lights
        //        sceneView.autoenablesDefaultLighting = true
        
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        
        // Show FPS logs and timming
        // sceneView.showsStatistics = true
        
        // Set background color
        sceneView.backgroundColor = UIColor.white
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        sceneView.scene = scene
    }
    
}

