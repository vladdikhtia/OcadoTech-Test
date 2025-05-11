//
//  HomeViewModel.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var products: [ItemModel] = []
    @Published var checkoutItems: [ItemModel] = []
    @Published var totalValue: Double = 0
    @Published var isBillPresented: Bool = false

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
    
    func updateCheckoutItems() {
        DispatchQueue.main.async {
            withAnimation {
                self.checkoutItems = self.products.filter { $0.quantity > 0 }
            }
        }
    }
    
    func updateQuantity(for productId: String, with newQuantity: Int) {
        if let index = products.firstIndex(where: { $0.productId == productId }) {
            products[index].quantity = newQuantity
        }
        
        updateCheckoutItems()
        updateTotalValue()
    }
    
    private func updateTotalValue() {
        let prices = products
            .filter { $0.quantity > 0 }
            .map { item -> Double in
                let priceString = item.price.replacingOccurrences(of: "£", with: "").trimmingCharacters(in: .whitespaces)
                let price = Double(priceString) ?? 0.0
                return price * Double(item.quantity)
            }
        
        self.totalValue = prices.reduce(0, +)
    }
}
