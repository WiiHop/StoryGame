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
    
    
    //hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: ViewDidLoad()
    override func viewDidLoad() {
        print(Data.data.count)
        displayNewStory()
        
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.savePoint = 0
                SavePoints.setSavePoint(x: 0) //reset everytime they lose
                self.displayNewStory()//viewDidLoad()
            }

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button1 tapped")
            self.textLable.text = Data.data[savePoint][3]
            
            //delay and then call continueStory ... so i can use the skip button
            perform(#selector(continueStory), with: nil , afterDelay: 10)
            
        }
        
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        if(savePoint>Data.data.count-1 || Data.correctButton[savePoint] != 2){
            print("This data.correct =" + String(Data.correctButton[savePoint]))
            print("inside if")
            //Show dead story and delay
            showDeadStory()
            disableButtons()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.savePoint = 0
                SavePoints.setSavePoint(x: 0) //reset everytime the lose
                self.displayNewStory()//viewDidLoad()
            }

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button 2 tapped")
            self.textLable.text = Data.data[savePoint][4]
            
            
            //delay and then call continueStory ... so i can use the skip button
            perform(#selector(continueStory), with: nil , afterDelay: 10)
            
        }
    }
    
    //show skip button and do nothing
    @objc func showSkipButton(){
        hideViews() // show skip button
        disableButtons()
    }
    
    @objc func continueStory(){
        SavePoints.setSavePoint(x: self.savePoint+1)
        enablebuttons() // enable buttons
        self.displayNewStory()//viewDidLoad()
        showViews()
    }
    
    //skipButton action
    @IBAction func skipButtonTapped(_ sender: Any) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        continueStory()
        resetTimer()
        showViews()
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
    
    //hide everything
    func hideViews(){
        button1View.isHidden = true
        button2View.isHidden = true
        skipButton.isHidden = false
    }
    
    func showViews(){
        button1View.isHidden = false
        button2View.isHidden = false
        enablebuttons()
        skipButton.isHidden = true
    }
    
    
    //timer function WARNNING WORKING ON!!!!
    @objc func updateTimeCounter() {
        if timeCounter < 0.99 {
            timeCounter += 0.1
            progressView.setProgress(Float(timeCounter), animated: true)
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
        dismiss(animated: false, completion: nil)
    }
    
    func showDeadStory() {

        DispatchQueue.main.async {
            self.textLable.text = Data.deadStories[self.savePoint]
            self.pictureStoryView.image = UIImage(named:"dead1") //+String(self.save)
            self.button1View.isHidden = true
            self.button2View.isHidden = true
        }
    }
    
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
                
                //reset the story , reset the buttons' labels
                textLable.text = Data.data[savePoint][0]
                button1Label.text = Data.data[savePoint][1]
                button2Label.text = Data.data[savePoint][2]

                //set PictureStoryView to appropriate picture
                pictureStoryView.image = UIImage(named:String(savePoint))
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
