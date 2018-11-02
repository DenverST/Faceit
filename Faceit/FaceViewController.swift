//
//  ViewController.swift
//  Faceit
//
//  Created by Denver Stove on 23/10/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class FaceViewController: VCLLoggingViewController {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingToTapRecognizer:)))
            faceView.addGestureRecognizer(tapRecognizer)
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swipeUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swipeUpRecognizer)
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swipeDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swipeDownRecognizer)
            updateUI()
        }
    }
    
    private struct HeadShake {
        
    }
    
    @objc func increaseHappiness() {
        expression = expression.happier
    }
    @objc func decreaseHappiness() {
        expression = expression.sadder
    }
    
    
    @objc func toggleEyes(byReactingToTapRecognizer tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .neutral) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        switch expression.eyes {
        case .open:
            faceView?.eyeOpen = true
        case .closed:
            faceView?.eyeOpen = false
        case .squinting:
            faceView?.eyeOpen = false
        }
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures: [FacialExpression.Mouth: Double] = [.grin:0.5,.frown:-1.0,.smile:1.0,.neutral:0.0,.smirk:-0.5]
}

