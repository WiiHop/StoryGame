//
//  CustomButtons.swift
//  raise your daughter
//
//  Created by Kien Phan on 11/17/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import Foundation
import SimpleButton



class ShadowButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, for: .normal, animated: true)
        setShadowRadius(3, for: .highlighted, animated: true)
        setBackgroundColor(UIColor.green, for: .normal, animated: true)
        setShadowColor(UIColor.gray, for: .normal)
        setShadowOpacity(1.0, for: .normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), for: .normal, animated: true)
        setTitle("SHADOW", for: .normal)
    }
}

class Button1SimpleButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, for: .normal, animated: true)
        setShadowRadius(3, for: .highlighted, animated: true)
        setBackgroundColor(UIColor(red: 0, green: 0.7922, blue: 0.9686, alpha: 1.0), for: .normal, animated: true)
        setShadowColor(UIColor.gray, for: .normal)
        setShadowOpacity(1.0, for: .normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), for: .normal, animated: true)
        setTitle("", for: .normal)
    }
}

class Button2SimpleButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, for: .normal, animated: true)
        setShadowRadius(3, for: .highlighted, animated: true)
        setBackgroundColor(UIColor(red: 1, green: 0.851, blue: 0.5765, alpha: 1.0), for: .normal, animated: true)
        setShadowColor(UIColor.gray, for: .normal)
        setShadowOpacity(1.0, for: .normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), for: .normal, animated: true)
        setTitle("", for: .normal)
    }
}

class HomePlayButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, for: .normal, animated: true)
        setShadowRadius(3, for: .highlighted, animated: true)
        setBackgroundColor(UIColor(red: 0, green: 0.7922, blue: 0.9686, alpha: 1.0), for: .normal, animated: true)
        setShadowColor(UIColor.gray, for: .normal)
        setShadowOpacity(1.0, for: .normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), for: .normal, animated: true)
        setTitle("Play", for: .normal)
    }
}



// MARK: extra subclasses for SimpleButton pod

//class ScaleButton: SimpleButton {
//    override func configureButtonStyles() {
//        super.configureButtonStyles()
//        setBackgroundColor(UIColor.blue, for: .normal)
//        setTitle("SCALE", for: .normal)
//        setScale(1.0, for: .normal, animated: true, animationDuration: 0.25)
//        setScale(0.96, for: .highlighted, animated: true, animationDuration: 0.1)
//    }
//}
//    class BackgroundColorButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setBackgroundColor(UIColor.green, for: .normal, animated: true, animationDuration: 0.2)
//            setBackgroundColor(UIColor.green, for: .highlighted, animated: false)
//            setBackgroundColor(UIColor.gray, for: SimpleButtonControlState.loading)
//            setTitle("BACKGROUND COLOR", for: .normal)
//        }
//    }
//
//    class BorderWidthButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setBackgroundColor(UIColor.green, for: .normal, animated: true)
//            setBorderColor(UIColor.gray, for: .normal, animated: true)
//            setTitle("BORDER WIDTH", for: .normal)
//            setBorderWidth(4.0, for: .normal, animated: true, animationDuration: 0.2)
//            setBorderWidth(8.0, for: .highlighted, animated: false)
//        }
//    }
//
//    class BorderColorButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setTitleColor(UIColor.green, for: .normal)
//            setTitleColor(UIColor.gray, for: .highlighted)
//            setBorderWidth(6.0, for: .normal)
//            setBorderColor(UIColor.red, for: .normal, animationDuration: 0.3)
//            setBorderColor(UIColor.blue, for: .highlighted, animated: false)
//            setTitle("BORDER COLOR", for: .normal)
//        }
//    }
//
//    class CornerRadiusButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setBackgroundColor(UIColor.green, for: .normal, animated: true)
//            setTitle("RADIUS", for: .normal)
//            setCornerRadius(10.0, for: .normal, animated: true)
//            setCornerRadius(30.0, for: .highlighted, animated: true)
//        }
//    }
//    class LoadingButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setBackgroundColor(UIColor.green, for: .normal)
//            setBackgroundColor(UIColor.gray, for: .highlighted)
//            setBackgroundColor(UIColor.blue, for: SimpleButtonControlState.loading)
//            setTitleColor(UIColor.white, for: .normal)
//            setTitle("PRESS TO START LOADING", for: .normal)
//        }
//    }
//
//    class DisabledButton: SimpleButton {
//        override func configureButtonStyles() {
//            super.configureButtonStyles()
//            setBackgroundColor(UIColor.green, for: .normal)
//            setBackgroundColor(UIColor.gray, for: .highlighted)
//            setTitle("PRESS TO DISABLE BUTTON", for: .normal)
//            setTitle("BUTTON DISABLED", for: .disabled)
//            setBackgroundColor(UIColor.blue, for: .disabled)
//            setTitleColor(UIColor.white, for: .normal)
//        }
//    }

