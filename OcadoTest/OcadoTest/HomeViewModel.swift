//
//  HomeViewModel.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var products: [ItemModel] = []
    let itemManager: ItemManagerProtocol
    
    init(itemManager: ItemManagerProtocol) {
        self.itemManager = itemManager
    }
    
    func getProducts() {
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            print("items not found in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let parsedItems = try itemManager.parseItems(from: data)
            self.products = parsedItems
        } catch {
            print("Failed to parse items: \(error)")
        }
    }
}
