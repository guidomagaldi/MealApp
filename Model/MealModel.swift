//
//  MealModel.swift
//  MealApp
//
//  Created by Guido Mola on 23/03/2022.
//

import Foundation

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strCategory: String
    let strInstructions: String
}
