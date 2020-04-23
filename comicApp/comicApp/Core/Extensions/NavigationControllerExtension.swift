//
//  NavigationControllerExtension.swift
//  comicApp
//
//  Created by Dario on 20/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func applyStyling( titleNavigationBar:String, controller: UIViewController, showButton:Bool) {
        navigationBar.barTintColor = .red
        navigationBar.barStyle = .black
        
        let title = UILabel()
        title.text = titleNavigationBar
        title.textColor = .white
        
        
        guard let customFont = UIFont(name: fontFamilyHero, size: fontSizeNavBar) else {
            fatalError("Failed to load the BADABB font.")
        }
        title.font = customFont
        
        
        if (showButton) {
            controller.navigationItem.leftBarButtonItems = [backButtonStyling(),fixedSpace(space: 10),UIBarButtonItem(customView: title)]
        }
        else {
            controller.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        }
    }
    
    private func backButtonStyling() -> UIBarButtonItem {
        
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self, action: #selector(popView), for: .touchUpInside)
        backButton.tintColor = .white
        
        let backButtonImage = UIImageView(image: UIImage(named: "back")?.withRenderingMode(.alwaysTemplate))
        backButton.setImage(backButtonImage.image, for: .normal)
        
        
        return UIBarButtonItem(customView: backButton)
    }
    
    private func fixedSpace(space:CGFloat) -> UIBarButtonItem {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = space
        return spacer
    }
    
    @objc private func popView() {
        popViewController(animated: true)
    }
}
