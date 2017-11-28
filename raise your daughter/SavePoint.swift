//
//  SavePoint.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/25/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import Foundation

public class SavePoints {
    static let savePointDefault = UserDefaults.standard
    
    static var savePoint = -1;
    
    static func setSavePoint(x:Int){
        savePointDefault.setValue(x, forKey: "savePoint")
        savePointDefault.synchronize()
        savePoint = savePointDefault.value(forKey: "savePoint") as! Int
    }
}
