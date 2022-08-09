//
//  CategoryManager.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import Foundation

final class CategoryManager{
    static let shared = CategoryManager()
    func fetchCategory(onCompletion: @escaping ([CategoryResponse])->()){
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                print("data nil")
                return
            }
            
            guard let category = try? JSONDecoder().decode([CategoryResponse].self, from: data) else{
                print("Couldn't decode Json")
                return
            }
            onCompletion(category.self)
        }
        task.resume()
    }
}
