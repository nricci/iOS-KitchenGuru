//
//  RecipeViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 23/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
 
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var recipe : Recipe? = nil
    
    var recipeImage : UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let recipe = self.recipe else { return }
        
        self.titleLabel.text = recipe.title
        self.ingredientsLabel.text = recipe.ingredients.joined(separator: ", ")
        if let path = recipe.imageLocalPath {
            self.imageView.image = UIImage(contentsOfFile: path)
        }
    }
}
