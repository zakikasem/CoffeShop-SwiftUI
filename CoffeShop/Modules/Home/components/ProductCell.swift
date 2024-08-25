//
//  ProductCell.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 25/08/2024.
//

import SwiftUI

struct ProductCell: View {
    
    @State var model: CoffeeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                
                Image(model.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .clipped()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text(model.rating.description)
                        .setFont(fontName: .mainFontBold, size: 12)
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .padding(5)
            }
            
            Text(model.name)
                .setFont(fontName: .mainFontMeduim, size: 16)
            
            Text(model.description)
                .setFont(fontName: .mainFont, size: 12)
                .foregroundColor(Color("#A2A2A2"))
            
            HStack {
                Text("$ \(model.price.description)")
                    .setFont(fontName: .mainFontSemiBold, size: 18)
                
                Spacer()
                
                Button(action: {
                    // Action for adding to cart
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("#C67C4E"))
                        .cornerRadius(12)
                }
            }
            .padding(.top, 4)
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(maxWidth: 166)
        
    }
}

#Preview {
    ProductCell(model: CoffeeModel(name: "Caffe Mocha", description: "Deep Foam", price: 4.53, rating: 4.8, imageName: "coffee_image"))
}
