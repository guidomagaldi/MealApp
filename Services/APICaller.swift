//
//  APICaller.swift
//  MealApp
//
//  Created by Guido Mola on 23/03/2022.
//

import Foundation

class APICaller{
    
    struct Constants{
        static let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    }
    
    enum APIError : Error {
        case failedToGetData
    }
    
    static let shared = APICaller()

    
    func searchMeal(completion: @escaping ( Result<[Meal], Error>) -> Void ) {
    guard let url = URL(string: "\(Constants.baseURL)search.php?f=a")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error  in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Meals.self, from: data)
                    completion(.success(result.meals))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
                
        }
        task.resume()
    }
    
}

