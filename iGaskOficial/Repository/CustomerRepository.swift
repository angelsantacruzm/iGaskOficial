//
//  CustomerRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class CustomerRepository {
    var listOfCustomers: [CustomerModel] = []
    var uploadedCustomers: [CustomerModel] = []
    
    func addCustomerModelToDatabase(birthDatecustom : String, latitudecustom: String, longitudecustom: String, namecustom: String){
        let key = Database.database().reference().child("customers").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let customer = CustomerModel.init(birthDatecustomer : birthDatecustom, datecustomer: dateString, idCustomercustomer: key, latitudecustomer: latitudecustom, longitudecustomer: longitudecustom, namecustomer: namecustom)
        Database.database().reference().child("customers").child(key).setValue(customer.toDictionary())
    }
    
    
    
    
}
