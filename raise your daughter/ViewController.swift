//
//  ViewController.swift
//  raise your daughter
//
//  Created by Kien Phan on 10/5/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//
import CoreData
import UIKit
import GradientProgressBar
import SimpleButton

class ViewController: UIViewController {
    
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var button1Label: UILabel!
    @IBOutlet weak var button2Label: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var button1View: UIView!
    @IBOutlet weak var button2View: UIView!
    @IBOutlet weak var progressView: GradientProgressBar!
    @IBOutlet weak var pictureStoryView: UIImageView!
    
//    let savePointDefault = UserDefaults.standard
    
    //declaring variables
    var timeCounter = 0.0
    var timer = Timer()
    var highscore = Highscore.highscore
    var savePoint = SavePoints.getSavePoint()
    var skipOrNot = 1 // this keep track so we know if skip button want to skip or stay on the same story (1 -> skip) (0 -> noSkip)
    let waitTime = 20.0
    
    
    //hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Data.data.count)
        displayNewStory()
        //playVoiceOver(voType: "Story",x: 0) ---> this was move to displayNewStory() but may cause crash

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        if(savePoint>Data.data.count-1 || Data.correctButton[savePoint] != 1){
print("This data.correct =" + String(Data.correctButton[savePoint]))
            print("inside if")
            //Show dead story and delay
            showDeadStory()
            disableButtons()
            showSkipButton()//working
            skipOrNot = 0
            progressView.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            perform(#selector(wrongAnswerConsequence), with: nil , afterDelay: waitTime)

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button1 tapped")
            self.textLable.text = Data.data[savePoint][3] // display story text
            self.pictureStoryView.image = UIImage(named:"action"+String(self.savePoint)) // display action image
            playVoiceOver(voType: "Action", x: 0) // play action voice over
            
            //delay and then call continueStory ... so i can use the skip button
            perform(#selector(continueStory), with: nil , afterDelay: waitTime)
            
        }
        
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        if(savePoint>Data.data.count-1 || Data.correctButton[savePoint] != 2){
            print("This data.correct =" + String(Data.correctButton[savePoint]))
            print("inside if")
            //Show dead story and delay
            showDeadStory()
            disableButtons()
            showSkipButton()//working
            skipOrNot = 0
            progressView.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            perform(#selector(wrongAnswerConsequence), with: nil , afterDelay: waitTime)

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button 2 tapped")
            self.textLable.text = Data.data[savePoint][4] //display story text
            self.pictureStoryView.image = UIImage(named:"dead"+String(self.savePoint)) // display action image
            playVoiceOver(voType: "Action", x: 0) // play action voice over
            
            //delay and then call continueStory ... so i can use the skip button
            perform(#selector(continueStory), with: nil , afterDelay: waitTime)
            
        }
    }
    
    //show skip button and do nothing
    @objc func showSkipButton(){
        hideViews() // show skip button
        disableButtons()
    }
    // MARK: this continues the story
    @objc func continueStory(){
        SavePoints.setSavePoint(x: self.savePoint+1)
        enablebuttons() // enable buttons
        self.displayNewStory()//viewDidLoad()
        showViews()
    }
    // MARK: this reset the savePoint and bring the user Back to the story 0
    @objc func wrongAnswerConsequence() {
        self.savePoint = 0
        SavePoints.setSavePoint(x: 0) //reset everytime the lose
        self.displayNewStory()//viewDidLoad()
    }
    
    
    
    //skipButton tapped
    @IBAction func skipButtonTapped(_ sender: Any) {
        if skipOrNot == 1 {
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            continueStory()
            resetTimer()
            showViews()
        } else {
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            wrongAnswerConsequence()
            resetTimer()
            showViews()
            skipOrNot = 1
        }
    }
    
    
    //disable button1 and button2 and homeButton
    func disableButtons(){
        button1.isEnabled = false
        button2.isEnabled = false
        homeButton.isEnabled = false

    }
    //enable button1 and button2
    @objc func enablebuttons(){
        button1.isEnabled = true
        button2.isEnabled = true
        homeButton.isEnabled = true
    }
    
    //hide everything and show skip button
    func hideViews(){
        button1View.isHidden = true
        button2View.isHidden = true
        homeButton.isHidden = true
        skipButton.isHidden = false
    }
    
    //show everything and hid skip button
    func showViews(){
        button1View.isHidden = false
        button2View.isHidden = false
        homeButton.isHidden = false
        enablebuttons()
        skipButton.isHidden = true
    }
    
    
    //timer function WARNNING WORKING ON!!!!
    @objc func updateTimeCounter() {
        if timeCounter < self.waitTime {
            timeCounter += 1
            progressView.setProgress(Float(timeCounter/waitTime), animated: true)
            progressView.reloadInputViews()
            print(timeCounter)
        } else {
            resetTimer()
            
        }
    }
    
    //reset Timer
    func resetTimer() {
        self.timer.invalidate()
        self.timeCounter = 0.0
    }
    
    @IBAction func segueToHomeScreenButton(_ sender: Any) {
        //WARNING: This stopVoice Over may cause problems
        stopVoiceOver()
        dismiss(animated: false, completion: nil)
    }
    
    func showDeadStory() {

        DispatchQueue.main.async {
            self.textLable.text = Data.deadStories[self.savePoint]
            self.pictureStoryView.image = UIImage(named:"dead"+String(self.savePoint)) //+String(self.save)
            playVoiceOver(voType: "Dead",x: 0)    //play dead voice over
            self.button1View.isHidden = true
            self.button2View.isHidden = true
        }
    }
    
    //display the story
    func displayNewStory() {
        
        print("savePoint = " + String(savePoint))
        print("Data.data.count = " + String(Data.data.count))
        
        //save highscore //WORKING
        if (highscore < savePoint) {
            Highscore.setHighscore(x: savePoint+1)
            highscore = savePoint
            //set Original highscore
            print("Highscore= " + String(Highscore.highscore))
        }
        
        
        //Enable button
        enablebuttons()
        
        //show button views
        showViews()
        
        //Using cocoapod gradient
        progressView.setProgress(0, animated: true)
        progressView.isHidden = true
        
        //disable and hide skipButtons
        skipButton.isHidden = true
        
        //this will set save to where it used to be last time played
        if (SavePoints.savePoint > -1){
            savePoint = SavePoints.savePoint
            
            if (savePoint < Data.data.count) { // WARNING MIGHT NEED FIXING SO IT DOESNT CRASH ***  MAYBE USE TRY AND CATCH
                
                //reset the story , reset the buttons' labels play
                textLable.text = Data.data[savePoint][0]
                button1Label.text = Data.data[savePoint][1]
                button2Label.text = Data.data[savePoint][2]

                //set PictureStoryView to appropriate story's picture
                pictureStoryView.image = UIImage(named:String(savePoint))
                
                //play the story voice over
                playVoiceOver(voType: "Story",x: 0)
            }
            else {
                print("savePoint is too big")
                savePoint = 0
                SavePoints.setSavePoint(x: 0);
                self.displayNewStory()
            }
        } else {
            SavePoints.setSavePoint(x: 0)
        }
    
    
    }
}
