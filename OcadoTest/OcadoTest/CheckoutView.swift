//
//  CheckoutView.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Header(type: .checkout, totalValue: $homeViewModel.totalValue)
                
                if !homeViewModel.checkoutItems.isEmpty {
                ReusableScroll(type: .checkout, homeViewModel: homeViewModel)
                
                    Button {
                        withAnimation {
                            homeViewModel.isBillPresented.toggle()
                        }
                    } label: {
                        Text("Checkout")
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .customText(
                                font: .headline,
                                color: .primary,
                                backgroundColor: .yellow
                            )
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(16)
                    }
                    
                    Divider()
                } else {
                    Label("Add some items to your cart", systemImage: "cart")
                        .font(.headline.bold())
                        .frame(maxHeight: .infinity, alignment: .center)
                }
            }
            
            if homeViewModel.isBillPresented {
                BillAlert(isPresented: $homeViewModel.isBillPresented, productIds: homeViewModel.checkoutItems.map({$0.productId}))
            }
        }
        
    }
}

#if DEBUG
#Preview {
    let mockManager = MockItemManager()
    CheckoutView(homeViewModel: HomeViewModel(itemManager: mockManager))
}
#endif
