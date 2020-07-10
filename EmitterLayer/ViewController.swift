//
//  ViewController.swift
//  EmitterLayer
//
//  Created by rain on 10/7/20.
//  Copyright © 2020 itsrain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       createParticles()
        badCode()
    }
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()

        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)

        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)

        particleEmitter.emitterCells = [red, green, blue]

        view.layer.addSublayer(particleEmitter)
    }

    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
//        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        
        cell.scaleRange = 0.9
        cell.scaleSpeed = -0.9
//        cell.scale = 0.1
        

        cell.contents = UIImage(named: "icon_star")?.cgImage
        return cell
    }
    
    
    func badCode () {
        
        //create particle emitter layer
        let screenWidth = UIScreen.main.bounds.size.width
        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
        
        
        //configure emitter
        emitter.renderMode = CAEmitterLayerRenderMode.additive
        emitter.emitterPosition = CGPoint(x: screenWidth / 2, y: screenWidth / 2)
        emitter.emitterShape = .point
//        emitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
//
        //create a particle template
        let cell = CAEmitterCell()
        cell.contents = UIImage(named:"icon_star")?.cgImage
        cell.birthRate = 5;
        //note:时长
        cell.lifetime = 10.0;
//        cell.color = UIColor(hue: 1, saturation: 0.6, brightness: 0.1, alpha: 1.0).cgColor
//        cell.color = UIColor.purple.cgColor
        cell.alphaSpeed = -0.25
        //note: 速度
        cell.velocity = 100
        cell.velocityRange = 50

        
        cell.emissionRange = CGFloat(Double.pi * 0.1)
        
        cell.scale = 0.3
        //缩放比例范围
        cell.scaleRange = 0.3
        cell.scaleSpeed = 0.2 //scale每秒变化率，负数缩小，正数放大
        cell.emissionLongitude = -CGFloat(Double.pi / 2)
        
        cell.spin = 2
        cell.spinRange = 3
        
        
        cell.redRange = 0.8
        cell.blueRange = 0.8
        cell.greenRange = 0.8
        
        //add particle template to emitter
        emitter.emitterCells = [cell]
        
        containerView.layer.addSublayer(emitter)
    }

}

