//
//  ViewExtension.swift
//  CheckInApp
//
//  Created by TrungNV on 11/1/19.
//  Copyright © 2019 devteam. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setRadius(_ radius: CGFloat = Constants.NORMAL_RADIUS) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    func createShadow(scale: Bool = true, color shadowColor: UIColor = Constants.SHADOW_VIEW_COLOR) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
