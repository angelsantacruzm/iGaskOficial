//
//  Step1toBuyViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import FirebaseDatabase

var myIndexpicker = ""
var precioamult: Float = 0

class Step1toBuyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var productDataAux = [ProductModel]()
    
    private let dataSource = ["Galon de 3 kg","Galon de 5 kg", "Galon de 10 kg","Galon de 15 kg","Galon de 45 kg"]
    
    @IBOutlet weak var estimatedTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var quantityFieldText: UITextField!
    @IBOutlet weak var priceTagLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self as UIPickerViewDataSource
        pickerView.delegate = self as UIPickerViewDelegate
        fetchProducts()
        // Do any additional setup after loading the view.
    }

    func fetchProducts(){
        ref = Database.database().reference()
        databaseHandle = ref?.child("products").observe(.childAdded, with: { (DataSnapshot) in
            if let dictionary = DataSnapshot.value as? [String: AnyObject]{
                let product = ProductModel()
                product.unitPrice = dictionary["unitPrice"] as! String
                self.productDataAux.append(product)
                self.priceTagLabel.text = product.unitPrice as String
                
                let myFloat = (self.priceTagLabel.text! as NSString).floatValue
                precioamult = myFloat
                //let auxTag = (self.priceTagLabel.text! as NSString).floatValue
                //let multiplication = myFloat*auxTag
                //self.estimatedTextField.text = NSString(format: "%.2f", multiplication) as String
                
                
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myIndexpicker = dataSource[pickerView.selectedRow(inComponent: 0)]
        myIndexpicker = dataSource[row]
    }

    @IBAction func calculateButton(_ sender: Any) {
        
        if (priceTagLabel.text != "" && quantityFieldText.text != ""){
            orderRepo.addOrderToDatabase(idcustomerord: "Default", idproductord: myIndexpicker, priceord: estimatedTextField.text!, quantityord: quantityFieldText.text!)
            
            estimatedTextField.text = ""
            quantityFieldText.text = ""
            
            performSegue(withIdentifier: "showExitoCompra", sender: self)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            
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
    
    @IBAction func cantidadEdit(_ sender: Any) {
        //let auxDeAux = (self.quantityFieldText.text  as! NSString).floatValue
        
        let mult1 = (self.quantityFieldText.text! as NSString).floatValue * precioamult
        estimatedTextField.text = NSString(format: "%.2f", mult1) as String
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
