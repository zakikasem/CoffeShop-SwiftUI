//
//  HomeViewModel.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 23/08/2024.
//

import SwiftUI

extension Array where Element == CategoryModel {
    static let categories = [
        CategoryModel(id: 1, name: "All Coffee", selected: true),
        CategoryModel(id: 2, name: "Machiato", selected: false),
        CategoryModel(id: 3, name: "Latte", selected: false),
        CategoryModel(id: 4, name: "Americano", selected: false)
    ]
}

extension Array where Element == CoffeeModel {
    static let mockCoffeeData: [CoffeeModel] = [
        CoffeeModel(name: "Caffe Mocha", description: "Deep Foam", price: 4.53, rating: 4.8, imageName: "coffee_image"),
        CoffeeModel(name: "Latte", description: "Smooth and Creamy", price: 3.99, rating: 4.7, imageName: "Coffe2"),
        CoffeeModel(name: "Espresso", description: "Strong and Bold", price: 2.99, rating: 4.9, imageName: "Coffe3"),
        CoffeeModel(name: "Cappuccino", description: "Rich Foam", price: 4.20, rating: 4.5, imageName: "Coffe4")
    ]
}


class HomeViewModel: ObservableObject {
    @Published var txt: String = ""
    @Published var isEditing = false
    
    @Published var data: [CategoryModel] = .categories
    
    @Published var coffes: [CoffeeModel] = .mockCoffeeData
}
