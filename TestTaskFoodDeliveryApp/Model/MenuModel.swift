//
//  MenuModel.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import Foundation

// MARK: - MenuModel
struct MenuModel: Decodable {
    let mensaje: String
    let ok: Bool
    let productos: [Producto]
}

// MARK: - Producto
struct Producto: Decodable {
    let id: Int
    let nombre, descripcion: String
    let linkImagen: String?
    let precio, tasaIva: String?
    let vendible: Int
    let borrado, stockRequerido: Int?
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, nombre, descripcion, linkImagen, precio, tasaIva, vendible, borrado, stockRequerido
        case createdAt = "created_at"
    }
}


