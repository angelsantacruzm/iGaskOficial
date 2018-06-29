//
//  CustomerModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/28/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON
class CustomerModel {
    
    var birthDate: String
    var date: String
    var idCustomer: String
    var latitude: String
    var longitude: String
    var name: String
    
    init() {
        
        birthDate = ""
        date = ""
        idCustomer = ""
        latitude = ""
        longitude = ""
        name = ""
    }
    
    init(birthDatecustomer : String, datecustomer: String, idCustomercustomer: String, latitudecustomer: String, longitudecustomer: String, namecustomer: String){
        date = datecustomer
        birthDate = birthDatecustomer
        idCustomer = idCustomercustomer
        latitude = latitudecustomer
        longitude = longitudecustomer
        name = namecustomer
    }
    
    init(from dictionary: [String: Any]) {
        date = dictionary["date"] as! String
        birthDate = dictionary["birthDate"] as! String
        idCustomer = dictionary["idCustomer"] as! String
        latitude = dictionary["latitude"] as! String
        longitude = dictionary["longitude"] as! String
        date = dictionary["date"] as! String
        name = dictionary["name"] as! String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["date"] = date
        dictionary["birthDate"] = birthDate
        dictionary["idCustomer"] = idCustomer
        dictionary["latitude"] = latitude
        dictionary["longitude"] = longitude
        dictionary["date"] = date
        dictionary["name"] = name
        return dictionary
    }
    
    
}
