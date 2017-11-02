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
    
    @IBOutlet weak var outputResult: UILabel!
    

    
    var runningNumber = ""
    var leftValNumber = ""
    var rightValNumber = ""
    var result = ""
    
    enum Operation:String {
        
        case Devided = "/"
        case Multiply = "*"
        case Addition = "+"
        case substruction = "-"
        case equal = "="
        case empty = " "
        
    }
    var currentOperation = Operation.empty
    
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
        
        runningNumber += "\(sender.tag)"
        outputResult.text = runningNumber
        
        
        
    }
    
    func buttonPlay() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        buttonSound.play()
    }
    
    func processOperation(operation:Operation){
        if currentOperation != Operation.empty {
            //A user slected an opetaror and then another opetator without entering first entry number
            if runningNumber != "" {
                
                rightValNumber = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Devided {
                    
                    result = "\(Double(leftValNumber)! / Double(rightValNumber)!)"
                
                }else if currentOperation == Operation.Multiply {
                    
                    result = "\(Double(leftValNumber)! * Double(rightValNumber)!)"
                    
                }else if currentOperation == Operation.Addition {
                    
                    result = "\(Double(leftValNumber)! + Double(rightValNumber)!)"
                    
                }else if currentOperation == Operation.substruction {
                    
                    result = "\(Double(leftValNumber)! - Double(rightValNumber)!)"
                    
                }
                
                leftValNumber = result
                outputResult.text = result
                
            }
             currentOperation = operation
        
        }else {
            //This is the first time an operator pressed
            
            leftValNumber = runningNumber
            runningNumber = ""
            
            currentOperation = operation
           }
}

    @IBAction func onDividePressed(sender:AnyObject) {
        
    processOperation(operation: .Devided)
        
    }
    @IBAction func onMultiplyPressed(sender:AnyObject) {
        
        processOperation(operation: .Multiply)
    }
    @IBAction func onAdditionPressed(sender:AnyObject) {
        
        processOperation(operation: .Addition)
        
    }
    @IBAction func onSustructionPressed(sender:AnyObject) {
        
        processOperation(operation: .substruction)
        
    }
    @IBAction func onEqualPressed(sender:AnyObject) {
        
        processOperation(operation: currentOperation)
        
    }

    @IBAction func clearBtn(_ sender: Any) {
        
        runningNumber = ""
        result = ""
        leftValNumber = ""
        rightValNumber = ""
        currentOperation = Operation.empty
        
        outputResult.text = "0"
        
    }
   
    @IBAction func dotPressed(_ sender: Any) {
        
        runningNumber += "."
        outputResult.text = runningNumber
    }


}
