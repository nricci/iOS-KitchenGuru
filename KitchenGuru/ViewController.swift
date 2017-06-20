//
//  ViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 20/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit

var meals : [[String:Any]] = []

class ViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // Populating cell
        let meal = meals[indexPath.row]
        cell.title.text = meal["name"] as! String
        cell.ingredients.text = (meal["ingredients"] as! [String]).joined(separator: ", ")
        let url = URL(string: meal["image_url"] as! String)
        getDataFromUrl(url: url!) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            //print(response?.suggestedFilename ?? url.lastPathComponent)
            //print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                cell.thumbnail.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: "https://private-d3acc-mealsapi1.apiary-mock.com/meals")
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                meals = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                self.table.reloadData()
            } catch let error as NSError {
                print(error)
            }
        }).resume()
        
    }


}

