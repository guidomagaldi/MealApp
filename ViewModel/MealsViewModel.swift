//
//  MealsViewModel.swift
//  MealApp
//
//  Created by Guido Mola on 23/03/2022.
//

import Foundation

class MealsViewModel{
    
    private let apiCaller = APICaller()
    var meals: [Meal] = []
   

    func searchMeals(completion: @escaping ([Meal]) -> ()){
        APICaller.shared.searchMeal { data in
            switch data{
                case.success(let meals):
                    self.meals = meals
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
}

