//
//  ViewController.swift
//  X-O
//
//  Created by Badria Alqanai on 6/27/20.
//  Copyright © 2020 Badria Alqanai. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    var backgroundMusic: AVAudioPlayer?
    var win: AVAudioPlayer?
    var doink: AVAudioPlayer?

    var buttons: [UIButton] = []
    var counter = 0
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8,  b9]
        playMusic()

    }
    @IBAction func press(_ sender: UIButton) {
        if counter % 2 == 0{
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.init(red: 255, green: 0, blue: 255, alpha: 1), for: .normal)
            turnLabel.text = "O turn"
            let path = Bundle.main.path(forResource: "doink.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                doink = try AVAudioPlayer(contentsOf: url)
                doink?.play()
            } catch {
                // couldn't load file :(
            }

    }
        else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.init(red: 0, green: 191, blue: 255, alpha: 1), for: .normal)
            turnLabel.text = "X turn"
            let path = Bundle.main.path(forResource: "doink.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                doink = try AVAudioPlayer(contentsOf: url)
                doink?.play()
            } catch {
                // couldn't load file :(
            }
            
        }
        counter += 1
        sender.isEnabled = false
        
        winning(winner: "X")
        winning(winner: "O")
        
    }
    
    @IBAction func resetTapped() {
        restartGame()
    }

    
    func winning (winner: String)
    {
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner){
            print("\(winner)wins")
            let alertController = UIAlertController(title: "\(winner) won", message: "press on button to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play again", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController,  animated: true, completion: nil)
            let path = Bundle.main.path(forResource: "applause.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                win = try AVAudioPlayer(contentsOf: url)
                win?.play()
            } catch {
                // couldn't load file :(
            }
            
        }
    }
    func restartGame ()  {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        
        counter = 0
        turnLabel.text = "X turn"
        
    }
    func playMusic(){
        let path = Bundle.main.path(forResource: "song.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
}

