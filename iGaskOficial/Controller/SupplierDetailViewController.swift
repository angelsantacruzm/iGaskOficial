//
//  SupplierDetailViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import GoogleMaps

class SupplierDetailViewController: UIViewController {
    
    var supplier: SupplierModel? {
        didSet {
            if let currentSupplier = supplier {
                print("Has a Supplier: \(currentSupplier.name)")
                
            }
        }
    }
    
    var name = String()
    var Description = String()
    var Phone = String()
    var latitudeMap = String()
    var longitudeMap = String()
    @IBOutlet weak var nameTxtLabel: UILabel!
    @IBOutlet weak var descriptionTxtLabel: UITextView!
    @IBOutlet weak var phoneTxtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        // Do any additional setup after loading the view.
    }
    
    func load(){
        nameTxtLabel.text! = name
        descriptionTxtLabel.text! = Description
        phoneTxtLabel.text! = Phone
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowMap"{
            let guest = segue.destination as! MapLocationViewController
            guest.latitudeMapLoc = latitudeMap
            guest.longitudMapLoc = longitudeMap
        }
    }
    

    @IBAction func sendButton(_ sender: Step1toBuyViewController) {
        performSegue(withIdentifier: "showBuy", sender: self)
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
