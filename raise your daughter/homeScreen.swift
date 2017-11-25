//
//  homeScreen.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/13/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import UIKit

class homeScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    //
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
