//
//  SaleViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class SaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var sale: SalesModel? {
            didSet {
                if let currentSale = sale {
                    print("Sale Found: \(currentSale.idSales)")
                    
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var cantidadTextField: UITextField!
    @IBOutlet weak var idOrderTextField: UITextField!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if (cantidadTextField.text != "" && idOrderTextField.text != ""){
            saleRepo.addSaleToDatabase(amountsale: cantidadTextField.text!, idordersale: idOrderTextField.text!)
            
            //(workName: nameTextField.text!, workDescription: descriptionTextField.text!, workBasePrice: Double(priceTextField.text!)!, workIdCategory: stringCategoryId)
            
            cantidadTextField.text = ""
            idOrderTextField.text = ""
            
            let dialog = UIAlertController(title: "Sale Added",
                                           message: "Sale has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Sale not Added",
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
