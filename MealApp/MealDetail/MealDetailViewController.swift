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
}
