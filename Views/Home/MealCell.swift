//
//  MealCell.swift
//  MealApp
//
//  Created by Guido Mola on 23/03/2022.
//

import Foundation
import UIKit


class MealCell : UITableViewCell {
    
    var meal : Meal? {
        didSet {
            mealNameLabel.text = meal?.strMeal
            mealCategoryLabel.text = meal?.strCategory
        }
    }
    
    
    private let mealNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let mealCategoryLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    

    
    private let mealImage : UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mealImage)
        addSubview(mealCategoryLabel)
        addSubview(mealNameLabel)

        
        mealImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        mealNameLabel.anchor(top: topAnchor, left: mealImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        mealCategoryLabel.anchor(top: mealNameLabel.bottomAnchor, left: mealImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(meal: Meal){
        mealNameLabel.text = meal.strMeal
        mealCategoryLabel.text = meal.strCategory
    }
    
}


