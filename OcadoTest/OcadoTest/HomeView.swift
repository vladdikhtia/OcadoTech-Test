//
//  HomeView.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label(
                        "Browse",
                        systemImage: "square.grid.3x3.fill"
                    )
                }
            
            CheckoutView()
                .tabItem {
                    Label(
                        "Checkout",
                        systemImage: "clock"
                    )
                }
        }
    }
}

#Preview {
    HomeView()
}
