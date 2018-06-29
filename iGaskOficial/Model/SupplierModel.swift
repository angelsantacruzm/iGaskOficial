//
//  SupplierModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/25/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON

class SupplierModel {
    
    var idSupplier : String
    var date : String
    var description : String
    var image : String
    var latitude : String
    var longitude : String
    var name : String
    var phone : String
    
    init() {
        idSupplier = ""
        date = ""
        description = ""
        image = ""
        latitude = ""
        longitude = ""
        name = ""
        phone = ""
    }
    
    init(idsupplier : String, datesupplier: String, descriptionsupplier: String, imagesupplier: String, latitudesupplier: String, longitudesupplier: String, namesupplier: String, phonesupplier: String ){
        idSupplier = idsupplier
        date = datesupplier
        description = descriptionsupplier
        image = imagesupplier
        latitude = latitudesupplier
        longitude = longitudesupplier
        name = namesupplier
        phone = phonesupplier
    }
    
    init(from dictionary: [String: Any]) {
        idSupplier = dictionary["idSupplier"] as! String
        date = dictionary["date"] as! String
        description = dictionary["description"] as! String
        image = dictionary["image"] as! String
        latitude = dictionary["latitude"] as! String
        longitude = dictionary["longitude"] as! String
        name = dictionary["name"] as! String
        phone = dictionary["phone"] as! String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["idSupplier"] = idSupplier
        dictionary["date"] = date
        dictionary["description"] = description
        dictionary["image"] = image
        dictionary["latitude"] = latitude
        dictionary["longitude"] = longitude
        dictionary["name"] = name
        dictionary["phone"] = phone
        return dictionary
    }
        
    
}
