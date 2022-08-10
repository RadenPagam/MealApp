//
//  foodDetail.swift
//  MealApp
//
//  Created by Dimas Pagam on 10/08/22.
//

import Foundation

struct MealList: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
