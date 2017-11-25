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

class Highscore {
    static let savePointDefault = UserDefaults.standard
    
    //WARNING THIS MAY CAUSE PROBLEM!!
    static var highscore = 0 // savePointDefault.value(forKey: "highscore") as! Int
    
    static func setHighscore(x:Int){
        savePointDefault.setValue(x, forKey: "highscore")
        savePointDefault.synchronize()
        highscore = savePointDefault.value(forKey: "highscore") as! Int
    }
    
   
    
}
