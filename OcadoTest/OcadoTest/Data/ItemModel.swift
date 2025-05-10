//
//  ItemModel.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import Foundation

struct ItemsContainer: Codable {
    let items: [ItemModel]
}

struct ItemModel: Codable {
    let productId: String
    let description: String
    let price: String
    let promotions: [PromotionModel]
    let isFavorite: Bool
    let inStock: Int
    let image: String
}

struct PromotionModel: Codable {
    let type: String
    let value: String
}
