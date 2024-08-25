//
//  SectionCell.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 23/08/2024.
//

import SwiftUI

struct SectionCell: View {
    
    @State var model: CategoryModel
    
    var body: some View {
        
        Text(model.name)
            .padding()
            .setFont(fontName: model.selected ? .mainFontBold : .mainFont, size: 16)
            .background(model.selected ? Color("#C67C4E") : Color("#EDEDED"))
            .foregroundStyle(model.selected ? .white : .black)
            .cornerRadius(8, corners: .allCorners)
            
    }
}

#Preview {
    SectionCell(model: CategoryModel(id: 1, name: "All Coffee", selected: true))
}
