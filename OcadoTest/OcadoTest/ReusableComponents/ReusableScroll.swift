//
//  ReusableScroll.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

struct ReusableScroll: View {
    let type: PageType
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12){
                ForEach(type == .browse ? $homeViewModel.products : $homeViewModel.checkoutItems, id: \.productId) { product in
                    ProductCard(product: product, homeViewModel: homeViewModel)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
