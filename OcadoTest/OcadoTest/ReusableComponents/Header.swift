//
//  Header.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 10/05/2025.
//

import SwiftUI

enum HeaderType {
    case browse, checkout
    
    var title: String {
        switch self {
        case .browse:
            return "Browse"
        case .checkout:
            return "Checkout"
        }
    }
}

struct Header: View {
    let type: HeaderType
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .trailing){
                Text(type.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                if type == .checkout {
                    Text("30.20 £")
                        .font(.headline)
                }
            }
            .padding(16)
            .customText(
                font: .title2.bold(),
                color: .primary,
                backgroundColor: Color.gray.opacity(0.2)
            )
            Divider()
        }
    }
}

#if DEBUG
#Preview {
    Header(type: .browse)
    Header(type: .checkout)
}
#endif
