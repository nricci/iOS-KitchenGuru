//
//  RecipyListViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 23/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//


import UIKit
import Alamofire

class RecipeListViewController: UITableViewController {
    
    
    @IBOutlet var table: UITableView!
    
    var selectedIndex : IndexPath? = nil
    
    var model = RecipesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.fetchDataFromBackend(notifyChanges: {self.table.reloadData()})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeCell
        
        // Populating cell
        let recipe = model.recipes[indexPath.row]
        cell.title.text = recipe.title
        cell.mealdescription.text = recipe.description
        if let imagePath = recipe.imageLocalPath {
            // if image is present
            cell.thumbnail.layer.masksToBounds = false
            cell.thumbnail.layer.cornerRadius = cell.thumbnail.frame.height/2
            cell.thumbnail.clipsToBounds = true
            cell.thumbnail.image = UIImage(contentsOfFile: imagePath)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        guard let navigator = self.navigationController else { return }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController {
            viewController.recipe = model.recipes[indexPath.row]
            navigator.pushViewController(viewController, animated: true)
        }
    }
    
    
    
}

