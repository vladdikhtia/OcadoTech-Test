//
//  HomeView.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    
    init(itemManager: ItemManagerProtocol = ItemManager()) {
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(itemManager: itemManager))
    }
    
    var body: some View {
        TabView {
            BrowseView(homeViewModel: homeViewModel)
                .tabItem {
                    Label(
                        "Browse",
                        systemImage: "square.grid.3x3.fill"
                    )
                }
            
            CheckoutView(homeViewModel: homeViewModel)
                .tabItem {
                    Label(
                        "Checkout",
                        systemImage: "clock"
                    )
                }
        }
        .task {
            homeViewModel.getProducts()
        }
    }
}

#if DEBUG
#Preview {
    HomeView()
}
#endif
