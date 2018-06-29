//
//  BrandViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        if (nameTextField.text != ""){
            brandRepo.addBrandModelToDatabase(namebrandBrand: nameTextField.text!)
            
            nameTextField.text = ""
            
            let dialog = UIAlertController(title: "Brand Added",
                                           message: "Brand has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Brand not Added",
                                           message: "Please fill up the containers.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        
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
