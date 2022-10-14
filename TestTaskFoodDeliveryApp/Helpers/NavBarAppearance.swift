//
//  NavBarAppearance.swift
//  Marketplace Analytics
//
//  Created by Линар Нигматзянов on 14/09/2022.
//

import UIKit

public func setupAppearanceNavigationBar(with controller: UINavigationController) {
    
    let navigationBarAppearance = UINavigationBarAppearance()
    
    navigationBarAppearance.backgroundColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    paragraphStyle.lineHeightMultiple = 1.01
    
    navigationBarAppearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)]
    
    navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1),
                                                        
        .paragraphStyle: paragraphStyle,
                                                        
        .kern: 0.41]
    UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
    
    controller.navigationBar.standardAppearance = navigationBarAppearance
    
    controller.navigationBar.compactAppearance = navigationBarAppearance
    
    controller.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    
    controller.navigationBar.compactScrollEdgeAppearance = navigationBarAppearance
    
    controller.navigationBar.setBackgroundImage(UIImage(), for: .default)
    
    controller.navigationBar.shadowImage = UIImage()
    
}


