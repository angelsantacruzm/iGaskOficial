//
//  BrandModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON
class BrandModel {
    
    var idBrand: String
    var date: String
    var name: String
    
    init() {
        
        idBrand = ""
        date = ""
        name = ""
    }
    
    init(idBrandbrand : String, datebrand: String, namebrand: String){
        date = datebrand
        idBrand = idBrandbrand
        name = namebrand
    }
    
    init(from dictionary: [String: Any]) {
        date = dictionary["date"] as! String
        idBrand = dictionary["idBrand"] as! String
        name = dictionary["name"] as! String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["date"] = date
        dictionary["idBrand"] = idBrand
        dictionary["name"] = name
        return dictionary
    }
    
    
}

