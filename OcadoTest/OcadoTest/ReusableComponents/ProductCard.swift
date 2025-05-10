//
//  ProductCard.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

struct ProductCard: View {
    @State var quantity: Int = 1
    let product: ItemModel
    @State var isFavorite: Bool = false
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .topLeading){
                Image(product.image.replacingOccurrences(of: ".png", with: ""))
                    .resizable()
                    .scaledToFit()
                
                Button {
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.blue)
                }
                .padding(10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.description)
                Text(product.price)
                    .customText(font: .subheadline.bold(), color: .red)
                    .padding(.top, 20)
                
                quantitySector
            }
            .padding(8)
        }
        .frame(height: 130)
        .customText(
            font: .headline,
            color: .primary,
            backgroundColor: .yellow.opacity(0.2)
        )
        .clipShape(.rect(cornerRadius: 20))
        .padding(.horizontal, 16)
        .onAppear{
            isFavorite = product.isFavorite
        }
    }
    
    var quantitySector: some View {
        HStack {
            countButton(title: "-")
            
            Text("\(quantity)")
                .frame(maxWidth: .infinity, alignment: .center)
            
            countButton(title: "+")
        }
        .customText(
            font: .body,
            color: .primary,
            backgroundColor: .white
        )
        .clipShape(.rect(cornerRadius: 8))
    }
    
    func countButton(title: String) -> some View {
        Button {
            if title == "-" {
                guard quantity > 1 else {return}
                quantity -= 1
            } else {
                quantity += 1
            }
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .center)
                .customText(
                    font: .title,
                    color: .primary,
                    backgroundColor: title == "-" ? .yellow.opacity(0.5) : .yellow
                )
        }
    }
}

#Preview {
    let mockManager = MockItemManager()
    ProductCard(product: mockManager.exampleItem)
}
