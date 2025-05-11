//
//  ProductCard.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

struct ProductCard: View {
    @Binding var product: ItemModel
    @ObservedObject var homeViewModel: HomeViewModel
    @State var isFavorite: Bool = false
    @State var presentedInStock: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            productImage
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.description)
                
                HStack{
                    Text(product.price)
                    Spacer()
                    if presentedInStock {
                        Text("Max: \(product.inStock)")
                            .padding(.trailing, 4)
                    }
                }
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
    var productImage: some View {
        ZStack(alignment: .topLeading){
            Image(product.image.replacingOccurrences(of: ".png", with: ""))
                .resizable()
                .scaledToFit()
            
            Button {
                product.isFavorite.toggle()
            } label: {
                Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(.blue)
            }
            .padding(10)
        }
    }
    
    var quantitySector: some View {
        HStack {
            countButton(title: "-")
            
            Text("\(product.quantity)")
                .frame(maxWidth: .infinity, alignment: .center)
            
            countButton(title: "+")
        }
        .customText(
            font: .body,
            color: .black,
            backgroundColor: .white
        )
        .clipShape(.rect(cornerRadius: 8))
    }
    
    func countButton(title: String) -> some View {
        Button {
            if title == "-" {
                guard product.quantity > 0 else {
                    return
                }
                presentedInStock = false
                homeViewModel.updateQuantity(for: product.productId, with: product.quantity - 1)
            } else {
                guard product.quantity < product.inStock else {
                    presentedInStock = true
                    return
                }
                homeViewModel.updateQuantity(for: product.productId, with: product.quantity + 1)
            }
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .center)
                .customText(
                    font: .title,
                    color: .black,
                    backgroundColor: title == "-" ? .yellow.opacity(0.5) : .yellow
                )
        }
    }
}
