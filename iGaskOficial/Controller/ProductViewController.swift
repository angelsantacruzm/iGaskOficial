//
//  ProductViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    
    
    @IBOutlet weak var idbrandTextField: UITextField!
    @IBOutlet weak var idcategoryTextField: UITextField!
    @IBOutlet weak var idsupplierTextField: UITextField!
    @IBOutlet weak var unitpriceprodTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var product: ProductModel? {
            didSet {
                if let currentProduct = product {
                    print("Product Found: \(currentProduct.idProduct)")
                    
                }
            }
        }
        
        
        //idbrandprod: String, idcategoryprod: String, idsupplierprod: String, unitpriceprod: String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendButton(_ sender: Any) {
        
        if (idbrandTextField.text != "" && idcategoryTextField.text != "" && idsupplierTextField.text != "" && unitpriceprodTextField.text != ""){
            productRepo.addProducToDatabase(idbrandprod: idbrandTextField.text!, idcategoryprod: idcategoryTextField.text!, idsupplierprod: idsupplierTextField.text!, unitpriceprod: unitpriceprodTextField.text!)
            
            //(workName: nameTextField.text!, workDescription: descriptionTextField.text!, workBasePrice: Double(priceTextField.text!)!, workIdCategory: stringCategoryId)
            
            idbrandTextField.text = ""
            idcategoryTextField.text = ""
            idsupplierTextField.text = ""
            unitpriceprodTextField.text = ""
            
            let dialog = UIAlertController(title: "Product Added",
                                           message: "Product has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Product not Added",
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
