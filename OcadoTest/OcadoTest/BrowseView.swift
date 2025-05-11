//
//  BrowseView.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import SwiftUI

struct BrowseView: View {
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 0) {
            Header(type: .browse, totalValue: $homeViewModel.totalValue)
            
            ReusableScroll(type: .browse, homeViewModel: homeViewModel)
        }
    }
}

#if DEBUG
#Preview {
    let mockManager = MockItemManager()
    BrowseView(homeViewModel: HomeViewModel(itemManager: mockManager))
}
#endif
