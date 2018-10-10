//
//  thomasViewController.swift
//  Thomas
//
//  Created by Chang Sophia on 2018/8/8.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class thomasViewController: UIViewController {
   var player: AVPlayer?
   var shape = ""

    @IBOutlet weak var ans1: UIButton!
    @IBOutlet weak var ans2: UIButton!
    @IBOutlet weak var playagain: UIButton!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var circleButton: UIButton!
    
    @IBOutlet weak var chuSlider: thomasSilder!
    var newNames: ArraySlice<String> = []
    var newCircles: ArraySlice<String> = []
    var newSquares: ArraySlice<String> = []
    
    let names = ["Edward", "Thomas", "Percy", "Emily", "Henry", "James", "Den", "Dart", "Donald", "Douglas", "Belle", "Gordon"]
    let circles = ["Ryan","Rex","Ashima","Arthur","Bill","Billy","Carlos","Charlie","Dash","Fredinand","Duncan","Duck","Fergus","Bash","Ben","Mike","Bert"]
    let squares = ["Clarabel", "Daisy", "Colin", "Diesel", "Dennis", "Etienne","Elizabeth", "Frankie", "Iron's arry", "Iron Bert", "Annie", "Toby", "Bertie", "Butch"]
    
    
    @IBAction func playagain(_ sender: UIButton) {
        self.chuSlider.value = 0
        ans1.isEnabled = true
        ans2.isEnabled = true
        
    }
    
    //12 questions
    @IBAction func nameButtonPressed(_ sender: UIButton) {
         shape = "name"
        newNames = names.shuffled()[0...1]
        let answerIndex = Int.random(in: 0...1)
        nameLabel.text = newNames[answerIndex]
        ans1.setBackgroundImage(UIImage(named: newNames[0]), for: UIControl.State.normal)
        ans2.setBackgroundImage(UIImage(named: newNames[1]), for: UIControl.State.normal)
        let speech = AVSpeechUtterance(string: nameLabel.text!)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speech)
        
    }

    //circle questions
    @IBAction func circleButtonPressed(_ sender: UIButton) {
          shape = "circle"
        newCircles = circles.shuffled()[0...1]
        let ansIndex = Int.random(in: 0...1)
        nameLabel.text = newCircles[ansIndex]
        ans1.setBackgroundImage(UIImage(named: newCircles[0]), for: UIControl.State.normal)
        ans2.setBackgroundImage(UIImage(named: newCircles[1]), for: UIControl.State.normal)
        let speech = AVSpeechUtterance(string: nameLabel.text!)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speech)
        
    }
    
    
    //square questions
    @IBAction func squareButtonPressed(_ sender: UIButton) {
          shape = "square"
     newSquares = squares.shuffled()[0...1]
        let ansIndex = Int.random(in: 0...1)
        nameLabel.text = newSquares[ansIndex]
        ans1.setBackgroundImage(UIImage(named: newSquares[0]), for: UIControl.State.normal)
        ans2.setBackgroundImage(UIImage(named: newSquares[1]), for: UIControl.State.normal)
        let speech = AVSpeechUtterance(string: nameLabel.text!)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speech)
        
    }
    

    
    @IBAction func ansButtonPressed(_ sender: UIButton) {
     
        if shape == "name"{
            if sender  == ans1 {
                if nameLabel.text ==  newNames[0] {
                    self.chuSlider.value = Float(self.chuSlider.value + 1)
                    if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                }
                else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                    if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                }
            } else if sender == ans2 {
                if nameLabel.text ==  newNames[1] {
                    self.chuSlider.value = Float(self.chuSlider.value + 1)
                    if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                }
                else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                    if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                }
            
            }
            
        } else if shape == "circle"{
                if sender == ans1 {
                    if nameLabel.text ==  newCircles[0] {
                        self.chuSlider.value = Float(self.chuSlider.value + 1)
                        if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                    }
                    else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                        if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                    }
                } else if sender == ans2 {
                    if nameLabel.text ==  newCircles[1]
                    {
                        self.chuSlider.value = Float(self.chuSlider.value + 1)
                        if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                       
                    }
                    else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                        if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                    }
                    
                }
                
            } else if shape == "square"{
           
                    if sender == ans1 {
                        if nameLabel.text ==  newSquares[0] {
                            self.chuSlider.value = Float(self.chuSlider.value + 1)
                            if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                                player = AVPlayer(url: url)
                                player?.play()
                            }
                        }
                        else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                            if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                                player = AVPlayer(url: url)
                                player?.play()
                            }
                        }
                    } else if sender == ans2 {
                        if nameLabel.text ==  newSquares[1]
                        {
                            self.chuSlider.value = Float(self.chuSlider.value + 1)
                            if let url = Bundle.main.url(forResource: "chuchu", withExtension: "mov") {
                                player = AVPlayer(url: url)
                                player?.play()
                            }
                       
                        }
                        else {self.chuSlider.value = Float(self.chuSlider.value - 1)
                            if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4") {
                                player = AVPlayer(url: url)
                                player?.play()
                            }
                        }
                        
                    }
                    
                }
        
                
        if self.chuSlider.value == 10{
            ans1.isEnabled = false
            ans2.isEnabled = false
            if let url = Bundle.main.url(forResource: "Thomas&his friends", withExtension: "m4a") {
                player = AVPlayer(url: url)
                player?.play()
                
            }
         
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

