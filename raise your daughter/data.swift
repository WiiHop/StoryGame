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
                        ["It is the year 1969, a hero was born and his crack head parents decided to name him ...",
                        "Stevie Wonder",
                        "Bob Bin laden",
                        "Stevie Wonder, was a great name for an up coming hero, the hero's dad said...",
                        "incorrect"],

                       ["Steve's dad decided to put steve in",
                        "Public school...",
                        "A box and ship him to nigeria!",
                        "Steve somehow survived public school without getting pregnant... that's right steve is a girl you sexist cunt! said the fag",
                        "incorrect"],

                       ["continue story3",
                        "story3Button1",
                        "story3Button2",
                        "story3Button1Action",
                        "story3Button2Action"],

                       ["ending1","","","",""],

                       ["ending2","","","",""],

                       ["ending3","","","",""],

                       ["ending4","","","",""]
        
         ]
    static var deadStories = [
            "USA Seal team was able to travel back in time and executed Bob Bin Laden who is going to be the notorious Osama Bin Laden!",
            "Steve drowned",
            "2",
            "3",
            "4",
            "5",
            "6"]
    static var correctButton = [1,1,2,1,2,1,2] //This mark which choice is correct on each story(n)

}
