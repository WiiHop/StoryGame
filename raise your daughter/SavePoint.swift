//
//  SavePoint.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/25/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import Foundation

public class SavePoints {

    static var savePoint = 0;
    
    static func setSavePoint(x:Int){
        UserDefaults.standard.set(x, forKey: "savePoint")
        savePoint = getSavePoint()
    }
    
    //Mark: allow other classes to get savepoint!
    static func getSavePoint() -> Int {
        if let x:Int = UserDefaults.standard.object(forKey: "savePoint") as? Int {
            savePoint = x;
        } else {
            savePoint = 0
        }
        return savePoint
    }
}
