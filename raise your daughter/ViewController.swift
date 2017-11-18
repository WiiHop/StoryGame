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
    
    
    override func viewDidLoad() {
        
        
        //Using cocoapod gradient
        progressView.setProgress(0, animated: true)
        
        super.viewDidLoad()
        //disable and hide skipButtons
        skipButton.isHidden = false
        
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
        if(save*2+1>5){
            print("inside if")
            save = 0
            saveFunc(x: 0);
            self.viewDidLoad()
        } else {
            
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            
            hideViews() // show skip button
            disableButtons()
            print("button1 tapped")
            self.textLable.text = Data.data[save][3]
            
            //delay and then call moveOn ... so i can use the skip button
            perform(#selector(moveOn1), with: nil , afterDelay: 10)
            
        }
        
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        whichButton = 2
        if(save*2+1>5){
            print("inside if")
            save = 0
            saveFunc(x: 0);
            self.viewDidLoad()
        } else {
            
            //timer use for action timing
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeCounter), userInfo: nil, repeats: true)
            
            hideViews() // show skip button
            disableButtons()
            print("button 2 tapped")
            self.textLable.text = Data.data[save][4]
            
            
            //delay and then call moveOn ... so i can use the skip button
            perform(#selector(moveOn2), with: nil , afterDelay: 10)
            
        }
    }
    
    //need to simplify these two methods
    @objc func moveOn1(){
        self.saveFunc(x: self.save*2+1);
        enablebuttons() // enable buttons
        self.viewDidLoad()
        showViews()
    }
    
    @objc func moveOn2(){
        self.saveFunc(x: self.save*2+2);
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
            //NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(moveOn1), object: nil)
            moveOn1()
            resetTimer()
        } else {
            //NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(moveOn2), object: nil)
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
    func enablebuttons(){
        button1.isEnabled = true
        button2.isEnabled = true
    }
    
    //hide everything
    func hideViews(){
        button1View.isHidden = true
        button2View.isHidden = true
    }
    
    func showViews(){
        button1View.isHidden = false
        button2View.isHidden = false
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
    
}

