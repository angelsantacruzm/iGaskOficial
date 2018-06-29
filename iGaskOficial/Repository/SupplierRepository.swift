//
//  SupplierRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/25/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SupplierRepository {
    var listOfSuppliers: [SupplierModel] = []
    var uploadedSuppliers: [SupplierModel] = []
    
    func addSupplierToDatabase(descriptionsupplier: String, imagesupplier: String, latitudesupplier: String, longitudesupplier: String, namesupplier: String, phonesupplier:String) {
        let key = Database.database().reference().child("suppliers").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let supplier = SupplierModel.init(idsupplier: key, datesupplier: dateString, descriptionsupplier: descriptionsupplier, imagesupplier: imagesupplier, latitudesupplier: latitudesupplier, longitudesupplier: longitudesupplier, namesupplier: namesupplier, phonesupplier: phonesupplier)
        Database.database().reference().child("suppliers").child(key).setValue(supplier.toDictionary())
    }
    
    func updateListOfSuppliers() {
        
        let ref = Database.database().reference().child("suppliers")
        print("Before")
        ref.observe(DataEventType.value, with: { snapshot in
            print(snapshot.childrenCount)
            print("During")
            let enumerator = snapshot.children
            self.listOfSuppliers = []
            self.uploadedSuppliers = []
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let restDict = rest.value as? [String: Any]
                let supplier = SupplierModel.init(from: restDict!)
                    self.listOfSuppliers.append(supplier)
                    self.uploadedSuppliers.append(supplier)
            }
        })
        print("Outside")
    }
    
    
}
