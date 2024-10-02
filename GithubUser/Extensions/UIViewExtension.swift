//
//  UIViewExtension.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    
    func circleRounded() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
}
