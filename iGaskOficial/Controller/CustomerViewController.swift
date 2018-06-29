//
//  CustomerViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    
    @IBOutlet weak var nameCustomerTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var longitudeCustTextField: UITextField!
    @IBOutlet weak var latitudeCustomTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var customer: CustomerModel? {
            didSet {
                if let currentCustomer = customer {
                    print("Customer Found: \(currentCustomer.idCustomer)")
                    
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        if (nameCustomerTextField.text != "" && birthdayTextField.text != "" && longitudeCustTextField.text != "" && latitudeCustomTextField.text != ""){
            customRepo.addCustomerModelToDatabase(birthDatecustom: birthdayTextField.text!, latitudecustom: latitudeCustomTextField.text!, longitudecustom: longitudeCustTextField.text!, namecustom: nameCustomerTextField.text!)
            //(idcustomerord: idcustomerTxtField.text!, idproductord: idproductTextField.text!, priceord: priceTextField.text!, quantityord: quantityTextField.text!)
            
            birthdayTextField.text = ""
            latitudeCustomTextField.text = ""
            longitudeCustTextField.text = ""
            nameCustomerTextField.text = ""
            
            let dialog = UIAlertController(title: "Customer Added",
                                           message: "Customer has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Customer not Added",
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
