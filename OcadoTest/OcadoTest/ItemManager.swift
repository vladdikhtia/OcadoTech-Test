//
//  ItemManager.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import Foundation

protocol ItemManagerProtocol {
    func parseItems(from json: Data) throws -> [ItemModel]
}

class ItemManager: ItemManagerProtocol {
    func parseItems(from json: Data) throws -> [ItemModel] {
        let decoder = JSONDecoder()
        let decodedContainer = try decoder.decode(ItemsContainer.self, from: json)
        return decodedContainer.items
    }
}

class MockItemManager: ItemManagerProtocol {
    func parseItems(from json: Data) throws -> [ItemModel] {
        return [
            ItemModel(
                productId: "mock-1",
                description: "Mock Coffee Beans",
                price: "15.99 £",
                promotions: [],
                isFavorite: true,
                inStock: 5,
                image: "coffee.png"
            ),
            ItemModel(
                productId: "mock-2",
                description: "Mock Water Bottle",
                price: "22.50 £",
                promotions: [
                    PromotionModel(type: "discount", value: "10.00 £")
                ],
                isFavorite: false,
                inStock: 12,
                image: "bottle.png"
            )
        ]
    }
}


