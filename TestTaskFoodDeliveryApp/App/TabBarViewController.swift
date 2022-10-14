//
//  TabBarViewController.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import UIKit

final class TabBarViewController: UITabBarController {
    private var arrayVc: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayVc.append(createViewController(itemType: TabBarItemController(controller: ModuleBuilder.createMenuScreen(), title: "Меню", imageName: "menuIcon", selectedImage: "menuIcon")))
        arrayVc.append(createViewController(itemType: TabBarItemController(controller: UIViewController(), title: "Контакты", imageName: "contactsIcon", selectedImage: "contactsIcon")))
        arrayVc.append(createViewController(itemType: TabBarItemController(controller: UIViewController(), title: "Профиль", imageName: "Union", selectedImage: "Union")))
        arrayVc.append(createViewController(itemType: TabBarItemController(controller: UIViewController(), title: "Корзина", imageName: "cart", selectedImage: "cart")))
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        viewControllers = arrayVc
    }
    
}

private extension TabBarViewController {
    func createViewController(itemType: TabBarItemController ) -> UIViewController {
        let viewController = UINavigationController(rootViewController: itemType.controller)
        viewController.tabBarItem = UITabBarItem(title: itemType.title,
                                                 image: UIImage(named: itemType.imageName)?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage(named: itemType.selectedImage)?.withRenderingMode(.alwaysOriginal))
        return viewController
    }
    
    
}
