//
//  ModuleBuilder.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import UIKit

protocol Builder {
    static func createTabBarController() -> UITabBarController
    static func createMenuScreen() -> UIViewController
    
}

final class ModuleBuilder: Builder {
    static func createTabBarController() -> UITabBarController {
        let tabbar = TabBarViewController()
        return tabbar
    }
    
    static func createMenuScreen() -> UIViewController {
        let view = MenuViewController()
        let networkService = NetworkService()
        let presenter = MenuPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
}
