//
//  RecipyDisplayViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 21/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit

class RecipyDisplayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var meal : [String:Any] = [:]
    
    var mealImage : UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.text = self.meal["name"] as? String
        self.ingredientsLabel.text = (meal["ingredients"] as! [String]).joined(separator: ", ")
        self.imageView.image = self.mealImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
