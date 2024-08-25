//
//  CategoryModel.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 23/08/2024.
//

import Foundation

struct CategoryModel: Identifiable {
    var id: Int
    let name: String
    var selected: Bool = false
}
