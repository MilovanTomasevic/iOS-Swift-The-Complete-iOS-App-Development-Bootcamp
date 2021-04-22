//
//  ViewController.swift
//  Xylophone
//
//  Created by Milovan Tomašević on 28/06/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
                
        sender.alpha = 0.5
        playSound(soundName: sender.currentTitle!)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0
            }
        }
        
        
    
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }


}

