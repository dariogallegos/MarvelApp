//
//  ViewExtension.swift
//  comicApp
//
//  Created by Dario on 23/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.7)
        
        let whiteColor = UIColor.white
        gradient.colors = [whiteColor.withAlphaComponent(0.0).cgColor, whiteColor.withAlphaComponent(1.0).cgColor, whiteColor.withAlphaComponent(1.0).cgColor]
        gradient.locations = [NSNumber(value: 0.0),NSNumber(value: 0.2),NSNumber(value: 1.0)]
        
        gradient.frame = self.bounds
        self.layer.mask = gradient
    }
}
