//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var eggTimes: [String : Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        timer.invalidate()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
//        if (hardness == "Soft") {
//            print(softTime)
//        } else if(hardness == "Medium") {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
    }
    
    @objc func updateTimer() {
        if (secondsPassed < totalTime) {
            let percentafeProgess = secondsPassed / totalTime
            
            progressBar.progress = Float(percentafeProgess)

            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    

}
