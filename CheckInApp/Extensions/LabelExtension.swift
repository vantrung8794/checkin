//
//  LabelExtension.swift
//  CheckInApp
//
//  Created by TrungNV on 11/1/19.
//  Copyright © 2019 devteam. All rights reserved.
//

import Foundation
import UIKit


/**
 let text = "YAAASSSSS!"
 label.text = text
 if label.applyGradientWith(startColor: .red, endColor: .blue) {
 print("Gradient applied!")
 }
 else {
 print("Could not apply gradient")
 label.textColor = .black
 }*/

extension UILabel{
    func changeToGradientText(_ startColor: UIColor = Constants.TOP_COLOR, _ endColor: UIColor = Constants.BOTTOM_COLOR, _ font: UIFont = UIFont.systemFont(ofSize: 17)){
        if self.applyGradientWith(startColor: startColor, endColor: endColor, font: font) {
        }
        else {
            self.textColor = endColor
        }
    }
    
    func applyGradientWith(startColor: UIColor, endColor: UIColor, font: UIFont) -> Bool {
        
        var startColorRed:CGFloat = 0
        var startColorGreen:CGFloat = 0
        var startColorBlue:CGFloat = 0
        var startAlpha:CGFloat = 0
        
        if !startColor.getRed(&startColorRed, green: &startColorGreen, blue: &startColorBlue, alpha: &startAlpha) {
            return false
        }
        
        var endColorRed:CGFloat = 0
        var endColorGreen:CGFloat = 0
        var endColorBlue:CGFloat = 0
        var endAlpha:CGFloat = 0
        
        if !endColor.getRed(&endColorRed, green: &endColorGreen, blue: &endColorBlue, alpha: &endAlpha) {
            return false
        }
        
        let gradientText = self.text ?? ""
        
        let name:String = NSAttributedString.Key.font.rawValue
        let textSize: CGSize = gradientText.size(withAttributes: [NSAttributedString.Key(rawValue: name): font])
        let width:CGFloat = textSize.width
        let height:CGFloat = textSize.height
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        
        UIGraphicsPushContext(context)
        
        let glossGradient:CGGradient?
        let rgbColorspace:CGColorSpace?
        let num_locations:size_t = 2
        let locations:[CGFloat] = [ 0.0, 1.0 ]
        let components:[CGFloat] = [startColorRed, startColorGreen, startColorBlue, startAlpha, endColorRed, endColorGreen, endColorBlue, endAlpha]
        rgbColorspace = CGColorSpaceCreateDeviceRGB()
        glossGradient = CGGradient(colorSpace: rgbColorspace!, colorComponents: components, locations: locations, count: num_locations)
        let leftCenter = CGPoint(x: 0, y: textSize.height)
        let rightCenter = CGPoint(x: textSize.width, y: textSize.height)
        context.drawLinearGradient(glossGradient!, start: leftCenter, end: rightCenter, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
        UIGraphicsPopContext()
        
        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        
        UIGraphicsEndImageContext()
        
        self.textColor = UIColor(patternImage: gradientImage)
        
        return true
    }
}
