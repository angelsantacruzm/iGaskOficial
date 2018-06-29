//
//  OrderViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/28/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    
    @IBOutlet weak var idcustomerTxtField: UITextField!
    
    @IBOutlet weak var idproductTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var order: OrderModel? {
            didSet {
                if let currentOrder = order {
                    print("Order Found: \(currentOrder.idOrder)")
                    
                }
            }
        }
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    
    @IBAction func sendButton(_ sender: Any) {
        if (idcustomerTxtField.text != "" && idproductTextField.text != "" && priceTextField.text != "" && quantityTextField.text != ""){
            orderRepo.addOrderToDatabase(idcustomerord: idcustomerTxtField.text!, idproductord: idproductTextField.text!, priceord: priceTextField.text!, quantityord: quantityTextField.text!)
            
            idcustomerTxtField.text = ""
            idproductTextField.text = ""
            priceTextField.text = ""
            quantityTextField.text = ""
            
            let dialog = UIAlertController(title: "Order Added",
                                           message: "Order has been created.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Order not Added",
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
