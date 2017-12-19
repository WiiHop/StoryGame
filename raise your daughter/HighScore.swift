//
//  ShareMethodsAndVariables.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/25/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//
import CoreData
import UIKit
import Foundation

// MARK: Highscore keeping
class Highscore {

    static var highscore = 0
    
    static func setHighscore(x:Int){
        UserDefaults.standard.set(x, forKey: "highscore")
        highscore = getHighscore()
    }
    
    //Mark: allow other classes to get highscore!
    static func getHighscore() -> Int {
        if let x:Int = UserDefaults.standard.object(forKey: "savePoint") as? Int {
            highscore = x;
        } else {
            highscore = 0
        }
        return highscore
    }
    
}
