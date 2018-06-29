//
//  SupplierDetailViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit

class SupplierDetailViewController: UIViewController {
    
    var supplier: SupplierModel? {
        didSet {
            if let currentSupplier = supplier {
                print("Has a Supplier: \(currentSupplier.name)")
                
            }
        }
    }
    
    var name = String()
    @IBOutlet weak var nameTxtLabel: UILabel!
    @IBOutlet weak var descriptionTxtLabel: UILabel!
    @IBOutlet weak var phoneTxtLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxtLabel.text! = name
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
