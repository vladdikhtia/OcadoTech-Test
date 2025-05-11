//
//  BillAlert.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

struct BillAlert: View {
    @Binding var isPresented: Bool
    let productIds: [String]
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 10) {
                header
                
                Text("Your order:")
                    .padding(.top, 10)
                Text(productIds.joined(separator: ", "))
            }
            .padding(16)
            .frame(width: 300)
            .frame(maxHeight: 400, alignment: .top)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 4)
        }
    }
    
    var header: some View {
        ZStack(alignment: .trailing) {
            Text("Bill")
                .frame(maxWidth: .infinity, alignment: .center)
                .customText(font: .title2.bold(), color: .black)
            
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.red)
            }
        }
    }
}
