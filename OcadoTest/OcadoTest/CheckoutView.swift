//
//  CheckoutView.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack(spacing: 0) {
            Header(type: .checkout)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<15) { _ in
                    Text("Item")
                        .padding(.vertical, 10)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.1))
            
            Button {
                
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
        }
    }
}

#Preview {
    CheckoutView()
}
