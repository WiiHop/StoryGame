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
                        ["You are steve, one of the most notorious and dangerous man/woman/other...dophins... whatever in the world. Do you Understand?",
                        "yes",
                        "no",
                        "wow such a smart gamer... lets continue this awesome story shal we ?",
                        "INCORRECT ANSWER -> GOTO DEAD STORY"],

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
            "Becuase of your idiotic answer steve who you! are supose to be was dragged into the street and shot DEAD! feels good?!",
            "2",
            "3",
            "4",
            "5",
            "6"]
    static var correctButton = [1,1,2,1,2,1,2] //This mark which choice is correct on each story(n)

}
