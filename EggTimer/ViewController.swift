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
    @IBOutlet weak var eggProgress: UIProgressView!
    let eggTimes = ["Soft":3,"Medium":420,"Hard":720]
    var totalTime = 0
    var secondRemaining = 60
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        eggProgress.progress = 0.1
        titleLabel.text = "How do you like your eggs?"

        secondRemaining = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
        
        
    }
@objc  func  updateTimer(){
    
    if secondRemaining > 0 {
        print("\(secondRemaining) .seconds")
        secondRemaining -= 1
        eggProgress.progress =  1.0 - (Float (secondRemaining) / Float(totalTime) )
        
        print(Float (secondRemaining) / Float(totalTime) )
    }else{
        timer.invalidate()
        titleLabel.text = "Done!"
    }
}

}
