//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Dimas Pagam on 10/08/22.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var titleHolder:String = ""
    var imageHolder:String = ""
    var idHolder:String = ""
    var mealDetail:[MealDetails] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        pageTitleLabel.text = titleHolder
        foodImage.loadImage(urlString: imageHolder)
        NetworkManager.shared.fetchRecepie(id: idHolder) { [weak self] result in
            guard let selfs = self else{
                return
            }
            
            switch result{
            case .success(let meal):
                selfs.updateMealDetail(meal:meal)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
       
    }
    
    func updateMealDetail(meal: RecepieData){
        DispatchQueue.main.async {
            self.mealDetail = meal.meals
            self.areaLabel.text = self.mealDetail.first?.strArea
            self.tagsLabel.text = self.mealDetail.first?.strTags ?? self.mealDetail.first?.strCategory
            
            self.textView.text = "\(self.mealDetail.first?.strInstructions ?? "")"
            
            var getIngredients =
                """
                 \(self.mealDetail.first?.strIngredient1 ?? "") \(self.mealDetail.first?.strMeasure1 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient2 ?? "") \(self.mealDetail.first?.strMeasure2 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient3 ?? "") \(self.mealDetail.first?.strMeasure3 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient4 ?? "") \(self.mealDetail.first?.strMeasure4 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient5 ?? "") \(self.mealDetail.first?.strMeasure5 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient6 ?? "") \(self.mealDetail.first?.strMeasure6 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient7 ?? "") \(self.mealDetail.first?.strMeasure7 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient8 ?? "") \(self.mealDetail.first?.strMeasure8 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient9 ?? "") \(self.mealDetail.first?.strMeasure9 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient10 ?? "") \(self.mealDetail.first?.strMeasure10 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient11 ?? "") \(self.mealDetail.first?.strMeasure11 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient12 ?? "") \(self.mealDetail.first?.strMeasure12 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient13 ?? "") \(self.mealDetail.first?.strMeasure13 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient14 ?? "") \(self.mealDetail.first?.strMeasure14 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient15 ?? "") \(self.mealDetail.first?.strMeasure15 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient16 ?? "") \(self.mealDetail.first?.strMeasure16 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient17 ?? "") \(self.mealDetail.first?.strMeasure17 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient18 ?? "") \(self.mealDetail.first?.strMeasure18 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient19 ?? "") \(self.mealDetail.first?.strMeasure19 ?? "")\n , \
                \(self.mealDetail.first?.strIngredient20 ?? "") \(self.mealDetail.first?.strMeasure20 ?? "")
                """.replacingOccurrences(of: " ,", with: "").trimmingCharacters(in: .whitespacesAndNewlines)

            if getIngredients.last == "," {
                _ = getIngredients.popLast()
            }
            
            self.ingredientsTextView.text = getIngredients + "."
        }
    }

}
