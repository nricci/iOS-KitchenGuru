//
//  Recipy.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 22/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import Foundation

class Recipe {
    
    // MARK: Properties
    
    var title = String()
    var description = String()
    var instructions = String()
    var imageUrl = String()
    var ingredients = [String]()
    
    var imageLocalPath : String?
    
    init?(fromJson json: [String:Any]) {
        guard let title = json["title"] as? String else { return nil }
        guard let description = json["description"] as? String else { return nil }
        guard let instructions = json["instructions"] as? String else { return nil }
        guard let imageUrl = json["image_url"] as? String else { return nil }
        guard let ingredients = json["ingredients"] as? [String] else { return nil }
    
        self.title = title
        self.description = description
        self.instructions = instructions
        self.imageUrl = imageUrl
        self.ingredients = ingredients
        
    }
    
}
