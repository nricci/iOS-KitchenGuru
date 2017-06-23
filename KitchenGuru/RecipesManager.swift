//
//  RecipesManager.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 22/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import Foundation
import Alamofire

let backendURL = "https://private-d3acc-mealsapi1.apiary-mock.com/meals"

class RecipesManager {
    
    var recipes = [Recipe]()
    
    var observers = Set<UITableViewController>()
    
/*    func suscribe(observer : UITableViewController) {
        self.observers.update(with: observer)
    }
    
    func unsuscribe(observer : UITableViewController) {
        self.observers.remove(observer)
    }
  */
    func fetchDataFromBackend(notifyChanges notifier: @escaping () -> Void) {
        // Fetches recipes from backend
        let queue = DispatchQueue.global(qos: .userInitiated)
        Alamofire.request(backendURL).responseJSON(queue: queue) { response in
            guard let recipesJson = response.result.value as? [[String:Any]] else {
                // TODO: Report error to the user
                print("Error retrieving data from server")
                return
            }
            
            for recipeJson in recipesJson {
                if let recipe = Recipe(fromJson: recipeJson) {
                    self.recipes.append(recipe)
                    
                    // Fetch image
                    let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
                    Alamofire.download(recipe.imageUrl, to: destination).response(queue: queue) { response in
                        if let imagePath = response.destinationURL?.path {
                            recipe.imageLocalPath = imagePath
                        }
                        DispatchQueue.main.async { notifier() }
                    }
                }
            }
            DispatchQueue.main.async { notifier() }
        }
    }
    
}
