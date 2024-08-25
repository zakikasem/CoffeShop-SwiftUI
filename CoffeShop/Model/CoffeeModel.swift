//
//  CoffeeModel.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 25/08/2024.
//

import Foundation

struct CoffeeModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let rating: Double
    let imageName: String
}
