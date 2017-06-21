//
//  ViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 20/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit
import Alamofire

let backendURL = "https://private-d3acc-mealsapi1.apiary-mock.com/meals"



class ViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    var meals : [[String:Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetches meals list from backend
        Alamofire.request(backendURL).responseJSON { response in
            let json = response.result.value as! [[String:Any]]
            self.meals = json
            self.table.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // Populating cell
        let meal = self.meals[indexPath.row]
        cell.title.text = meal["name"] as! String
        cell.ingredients.text = (meal["ingredients"] as! [String]).joined(separator: ", ")
        // fetch thumbnail
        Alamofire.request(meal["image_url"] as! String).responseData { response in
            if let data = response.result.value {
                cell.thumbnail.image = UIImage(data: data)
            }
        }
        return cell
    }
    
    


}

