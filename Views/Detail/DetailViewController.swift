//
//  DetailViewController.swift
//  MealApp
//
//  Created by Guido Mola on 24/03/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meal : Meal?
    
    init(meal: Meal) {
        self.meal = meal
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var mealImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
//        imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        imgView.translatesAutoresizingMaskIntoConstraints = false

        return imgView
    }()
    
    
    private var mealCategoryLabel : UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //        lbl.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mealImage)
        view.addSubview(mealCategoryLabel)
        view.backgroundColor = .white
        
        
        configureView()
        applyConstraints()
        // Do any additional setup after loading the view.
        print(mealCategoryLabel)
        print(mealImage)
    }
    
    func configureView(){
        mealCategoryLabel.text = meal?.strCategory
        if let url = meal?.strMealThumb {
            print(url)
        guard let urlString = URL(string: url) else { return }
            let getData = URLSession.shared.dataTask(with: urlString) { data, _, error  in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.mealImage.image = image

                }
                
          
            }
            getData.resume()
        }
}
    
    
    
    private func applyConstraints(){
        
        //Forma uno
        let imgViewConstraints = [
            mealImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            mealImage.widthAnchor.constraint(equalToConstant: 100),
            mealImage.heightAnchor.constraint(equalToConstant: 100)

        ]
        
        let categoryLabelConstraints = [
            mealCategoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealCategoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mealCategoryLabel.widthAnchor.constraint(equalToConstant: 100)
            
        ]
        
        NSLayoutConstraint.activate(imgViewConstraints)
        NSLayoutConstraint.activate(categoryLabelConstraints)
    }
    //
}
