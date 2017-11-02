//
//  ViewController.swift
//  Retro-Calculator
//
//  Created by MacBook Air on 11/1/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var buttonSound:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            
            try buttonSound = AVAudioPlayer(contentsOf: soundUrl)
            buttonSound.prepareToPlay()
            
            
        }catch let err as NSError {
            
            print(err.debugDescription)
        }
        
        
    }
    
    @IBAction func numberPressed(sender:UIButton) {
        
        buttonPlay()
        
    }
    
    func buttonPlay() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        buttonSound.play()
    }

   


}

