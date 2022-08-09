//
//  Category.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import Foundation


struct CategoryList: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}




