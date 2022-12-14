//
//  imageExtension.swift
//  MealApp
//
//  Created by Dimas Pagam on 09/08/22.
//

import Foundation
import UIKit

extension UIImageView{
    func loadImage(urlString:String){
        guard let url = URL(string: urlString) else{
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
