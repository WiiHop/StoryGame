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
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var button1Label: UILabel!
    @IBOutlet weak var button2Label: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var button1View: UIView!
    @IBOutlet weak var button2View: UIView!
    @IBOutlet weak var progressView: GradientProgressBar!
    @IBOutlet weak var pictureStoryView: UIImageView!
    
    //storing the save of the story *** temporary need a better way ***
    let savePointDefault = UserDefaults.standard
    
    //declaring variables
    var save = 0;
    var whichButton = 0 // which button is tapped
    var timeCounter = 0.0
    var timer = Timer()
    
    //hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: ViewDidLoad()
    override func viewDidLoad() {
print("save = " + String(save))
        //Enable button
        enablebuttons()
        
        //show button views
        showViews()
        
        //Using cocoapod gradient
        progressView.setProgress(0, animated: true)
        progressView.isHidden = true
        
        super.viewDidLoad()
        //disable and hide skipButtons
        skipButton.isHidden = true

        //this will set save to where it used to be last time played
        if (savePointDefault.value(forKey: "savePoint") != nil){
            save = savePointDefault.value(forKey: "savePoint") as! Int
            if (save <= 6) { // WARNING NEED FIXING SO IT DOESNT CRASH ***  MAYBE USE TRY AND CATCH
                //reset the story , reset the buttons' labels
                textLable.text = Data.data[save][0]
                button1Label.text = Data.data[save][1]
                button2Label.text = Data.data[save][2]
                //pictureStoryView. NEED TO ADD IMAGE AND CHANGE IT ACCORDING TO STORY <-------WORKING ON !!!!!
                //TESTING PictureStoryView
                pictureStoryView.image = UIImage(named:String(save))
            }
            else {
                print("save is too big")
                save = 0
                saveFunc(x: 0);
                self.viewDidLoad()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        whichButton = 1
        if(save>6 || Data.correctButton[save] != 2){
print("This data.correct =" + String(Data.correctButton[save]))
            print("inside if")
            //Show dead story and delay
            showDeadStory()
            disableButtons()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.save = 0
                self.saveFunc(x: 0);
                self.viewDidLoad()
            }

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button1 tapped")
            self.textLable.text = Data.data[save][3]
            
            //delay and then call moveOn ... so i can use the skip button
            perform(#selector(moveOn1), with: nil , afterDelay: 10)
            
        }
        
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        whichButton = 2
        if(save>6 || Data.correctButton[save] != 1){
            print("This data.correct =" + String(Data.correctButton[save]))
            print("inside if")
            //Show dead story and delay
            showDeadStory()
            disableButtons()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.save = 0
                self.saveFunc(x: 0);
                self.viewDidLoad()
            }

        } else {
            //SHOW SKIP BUTTON AND PROGRESS BAR
            progressView.isHidden = false
            showSkipButton()
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            disableButtons()
            print("button 2 tapped")
            self.textLable.text = Data.data[save][4]
            
            
            //delay and then call moveOn ... so i can use the skip button
            perform(#selector(moveOn2), with: nil , afterDelay: 10)
            
        }
    }
    
    //show skip button and do nothing
    @objc func showSkipButton(){
        hideViews() // show skip button
        disableButtons()
    }
    
    //need to simplify these two methods
    @objc func moveOn1(){
        self.saveFunc(x: self.save+1);
        enablebuttons() // enable buttons
        self.viewDidLoad()
        showViews()
    }
    
    @objc func moveOn2(){
        self.saveFunc(x: self.save+1);
        enablebuttons() // enable buttons
        self.viewDidLoad()
        showViews()
    }
    
    
    
    
    
    // this function will set the progress to iphone's memory
    func saveFunc(x:Int){
        savePointDefault.setValue(x, forKey: "savePoint")
        savePointDefault.synchronize()
    }
    
    
    
    
    //skipButton action
    @IBAction func skipButtonTapped(_ sender: Any) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        if(whichButton == 1){
            moveOn1()
            resetTimer()
        } else {
            moveOn2()
            resetTimer()
        }
        showViews()
    }
    
    
    //disable button1 and button2
    func disableButtons(){
        button1.isEnabled = false
        button2.isEnabled = false
    }
    //enable button1 and button2
    @objc func enablebuttons(){
        button1.isEnabled = true
        button2.isEnabled = true
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
            self.textLable.text = Data.deadStories[self.save]
            self.pictureStoryView.image = UIImage(named:"dead1") //+String(self.save)
            self.button1View.isHidden = true
            self.button2View.isHidden = true
        }
    }
    
    
    
}

