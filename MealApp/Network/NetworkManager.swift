//
//  NetworkManager.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    
    //MARK: - fetch categories data
    func fetchCategorytList(onCompletion:  @escaping ([Category])->()){
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) {( data, resp, error )in
            guard let data = data else{
                print("data nil")
                return
            }
            guard let category = try? JSONDecoder().decode(CategoryList.self, from: data) else{
                print("couldn't decode user Json")
                return
            }
            
            onCompletion(category.categories)
        }
        task.resume()
    }
    
    //MARK: - Fetch Meal data
    func fetchMealList(categories:String, onCompletion: @escaping ([Meal])->()){
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categories)"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) {( data, resp, error )in
            guard let data = data else{
                print("data nil")
                return
            }
            guard let meal = try? JSONDecoder().decode(MealList.self, from: data) else{
                print("couldn't decode user Json")
                return
            }
            
            onCompletion(meal.meals)
        }
        task.resume()
        
    }
}
