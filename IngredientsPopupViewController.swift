//
//  IngredientsPopupViewController.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 21/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit

class IngredientsPopupViewController: UIViewController {

    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
