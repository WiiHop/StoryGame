//
//  data.swift
//  raise your daughter
//
//  Created by Kien Phan on 10/26/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import Foundation

class Data {
//    index: # is -> which story level we at....?
//    INNER index:    0              1              2                  3                4
//    INNER value: storyDetails  button1Label    button2Label    button1Action    button2Action
    static var data = [
                        ["You saw a fox!",
                        "pet it",
                        "slap it",
                        "the fox bites you",
                        "the fox ran away"],

                       ["You DEAD!",
                        "X__X",
                        "X__X",
                        "X__X",
                        "X__X"],

                       ["story3",
                        "story3Button1",
                        "story3Button2",
                        "story3Button1Action",
                        "story3Button2Action"],

                       ["ending1","","","",""],

                       ["ending2","","","",""],

                       ["ending3","","","",""],

                       ["ending4","","","",""]
        
         ]
    static var deadStories = ["fox riped your dead out","1","2","3","4","5","6"]
    static var correctButton = [2,1,2,1,2,1,2]

}
