//
//  SupplierViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/25/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class SupplierViewController: UIViewController {
    
    var supplier: SupplierModel? {
        didSet {
            if let currentSupplier = supplier {
                print("Supplier Found: \(currentSupplier.name)")
                
            }
        }
    }

    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var imageTextField: UITextField!
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButton(_ sender: Any) {
        if (nameTextField.text != "" && descriptionTextField.text != ""){
            supplierRepo.addSupplierToDatabase(descriptionsupplier: descriptionTextField.text!, imagesupplier: imageTextField.text!, latitudesupplier: latitudeTextField.text!, longitudesupplier: longitudeTextField.text!, namesupplier: nameTextField.text!, phonesupplier: phoneTextField.text!)
            
            //(workName: nameTextField.text!, workDescription: descriptionTextField.text!, workBasePrice: Double(priceTextField.text!)!, workIdCategory: stringCategoryId)
            
            nameTextField.text = ""
            descriptionTextField.text = ""
            imageTextField.text = ""
            latitudeTextField.text = ""
            longitudeTextField.text = ""
            phoneTextField.text = ""
            
            let dialog = UIAlertController(title: "Supplier Added",
                                           message: "Supplier has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Supplier not Added",
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
