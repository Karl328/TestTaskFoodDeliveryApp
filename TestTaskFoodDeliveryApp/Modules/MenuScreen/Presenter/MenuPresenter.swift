//
//  MenuPresenter.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, networkService: NetworkServiceProtocol)
    func getMenu()
    var menuArray: [Producto]? {get set}
    var bannerArray: [String] {get set}
    var categoryArray: [String] {get set}
}

final class MenuPresenter: MenuViewPresenterProtocol {
    var categoryArray: [String] = ["Пицца", "Комбо", "Десерты", "Напитки"]
    
    var bannerArray: [String] = ["banner1", "banner2", "banner3"]
    
    var menuArray: [Producto]?
    
    weak var view: MenuViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    
    required init(view: MenuViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getMenu()
    }
    
    func getMenu() {
        networkService.makeAPIRequest(with: URLFactory.getMenuPizzaRequest(), MenuModel.self) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let menu):
                    self.menuArray = menu.productos
                    self.view?.success()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
}
