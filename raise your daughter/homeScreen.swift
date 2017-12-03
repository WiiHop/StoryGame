//
//  homeScreen.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/13/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import UIKit
import AVFoundation

class homeScreen: UIViewController {
    @IBOutlet weak var highscoreNumLable: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    
    //set Up audio
    func setUpbackgroundSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: "Art Of Silence", ofType: "mp3")!))
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
        } catch {
            print("error caught: ")
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpbackgroundSound()
        //start background music
        audioPlayer.play()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        
        // MARK: Highscore Setting
        if(Highscore.highscore > SavePoints.savePoint){
        highscoreNumLable.text = String(Highscore.highscore)
        } else {
            Highscore.setHighscore(x: SavePoints.savePoint)
            highscoreNumLable.text = String(Highscore.highscore)
        }
    }
    
    @IBAction func newGameButtonTapped(_ sender: Any) {
        
    }
    
    //This code segue to the homescreen
    @IBAction func segueToGameScreenButton(_ sender: Any) {
        performSegue(withIdentifier: "gotoGameScreen", sender: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

//MUSIC CREATOR : uniq https://www.youtube.com/channel/UCV-OE1O2SpfSaneY5awNR0w
