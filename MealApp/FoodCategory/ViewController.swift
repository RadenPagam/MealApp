//
//  ViewController.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var category :[Category] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let categoryFunc = {
            (fetchCategory:[Category]) in
            DispatchQueue.main.async {
                self.category = fetchCategory
                self.tableView.reloadData()
            }
        }
        NetworkManager.shared.fetchCategorytList(onCompletion: categoryFunc)
     
    }


}

//MARK: - TableViewDelegate
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as? MealViewController{
            self.navigationController?.pushViewController(vc, animated: true)
            vc.foodTypeHolder = category[indexPath.row].strCategory
        }
    }
}

//MARK: - TableViewDatasource
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath) as! FoodCategoriesTableViewCell
        
        cell.foodLabel.text = category[indexPath.row].strCategory
            cell.foodImage.loadImage(urlString: category[indexPath.row].strCategoryThumb)
    
        return cell
    }
    
    
}

