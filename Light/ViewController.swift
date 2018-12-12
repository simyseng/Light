//
//  ViewController.swift
//  Light
//
//  Created by Sim Yong Seng on 5/10/18.
//  Copyright © 2018 Sim Yong Seng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
        toggleTorch(on: lightOn ? true : false)
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}

