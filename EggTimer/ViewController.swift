//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelText: UILabel!
    
    
    var eggTimes : [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    var plusOne = 0
    var timer = Timer()
    var player: AVAudioPlayer?

    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        
        timer.invalidate()
        let harness = sender.currentTitle!

        plusOne = eggTimes[harness]! + 1
        
        let x = 1.0 / Float(eggTimes[harness]!)

        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.eggTimes[harness]! >= 0 {
                print ("\(self.eggTimes[harness]!) seconds.")
                self.eggTimes[harness]! -= 1
                progressBar.progress -= x
            } else {
                Timer.invalidate()
                self.labelText.text = "Done!"
                playSound()
                origLabel()
            }
        }
    }
    
    
        
    
    func origLabel(){
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [self] (Timer) in
            self.labelText.text = "How do you like your eggs?"
        }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    
//    if timer == 0{
//        self.labelText.text = "Done!"
//    }
    
}






