//
//  SearchSupplierViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import FirebaseDatabase

    var myIndex = 0

class SearchSupplierViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var supplierData = [String]()
    var supplierDataAux = [SupplierModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        //ref = Database.database().reference()
    //    databaseHandle = ref?.child("suppliers").queryOrderedByKey().observe(.childAdded, with:{ (DataSnapshot) in
            
    //        let supplier = DataSnapshot.value as? NSDictionary
    //       let name = supplier?["name"] as? String
    //        let description = supplier?["description"] as? String
            
    //        if let actualsupplier = name{
    //            self.supplierData.append(actualsupplier)
    //            self.tableView.reloadData()
    //        }

    //   })
        
        fetchUsers()
        
    }

    func fetchUsers(){
        ref = Database.database().reference()
        databaseHandle = ref?.child("suppliers").observe(.childAdded, with: { (DataSnapshot) in
            if let dictionary = DataSnapshot.value as? [String: AnyObject]{
                let supplier = SupplierModel()
                supplier.name = dictionary["name"] as! String
                supplier.description = dictionary["description"] as! String
                supplier.phone = dictionary["phone"] as! String
                self.supplierDataAux.append(supplier)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return supplierData.count
        return supplierDataAux.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //cell?.textLabel?.text = supplierData[indexPath.row]
        let suppliers = supplierDataAux[indexPath.row]
        cell?.textLabel?.text = suppliers.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "showSupplier", sender: supplierDataAux[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let categoryselected = supplierDataAux[selectedRow]
            
            let guest = segue.destination as! SupplierDetailViewController
            guest.name = categoryselected.name
            guest.Description = categoryselected.description
            guest.Phone = categoryselected.phone
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
