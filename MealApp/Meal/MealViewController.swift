//
//  FoodDetailViewController.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import UIKit

class MealViewController: UIViewController {

    var foodTypeHolder:String = ""
    var meal:[Meal] = []
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        foodTypeLabel.text = "\(foodTypeHolder) :"
        
        let mealFunc = {
            (fetchMeal:[Meal]) in
            DispatchQueue.main.async {
                self.meal = fetchMeal
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchMealList(categories: foodTypeHolder, onCompletion: mealFunc)
    }
    
}


//MARK: - TableViewDelegate
extension MealViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "recepieView") as? MealDetailViewController{
            self.navigationController?.pushViewController(vc, animated: true)
            vc.imageHolder = meal[indexPath.row].strMealThumb 
            vc.titleHolder = meal[indexPath.row].strMeal 
            vc.idHolder = meal[indexPath.row].idMeal 
        
        }
    }
}

//MARK: - TableViewDatasource
extension MealViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! MealTableViewCell
        cell.foodName.text = meal[indexPath.row].strMeal
        cell.foodImage.loadImage(urlString: meal[indexPath.row].strMealThumb)
        return cell
    }
}

