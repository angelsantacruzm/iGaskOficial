//
//  ProductModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON
class ProductModel {
    
    var date : String
    var idBrand : String
    var idCategory : String
    var idProduct : String
    var idSupplier : String
    var unitPrice : String
    
    init() {
        date = ""
        idBrand = ""
        idCategory = ""
        idProduct = ""
        idSupplier = ""
        unitPrice = ""
    }
    
    init(idproductprods : String, idbrandprods: String, idcategoryprods: String, idsupplierprods: String, unitpriceprods: String, dateprods: String){
        date = dateprods
        idProduct = idproductprods
        idBrand = idbrandprods
        idCategory = idcategoryprods
        idSupplier = idsupplierprods
        unitPrice = unitpriceprods
    }
    
    init(from dictionary: [String: Any]) {
        idBrand = dictionary["idBrand"] as! String
        idCategory = dictionary["idCategory"] as! String
        date = dictionary["date"] as! String
        idProduct = dictionary["idProduct"] as! String
        idSupplier = dictionary["idSupplier"] as! String
        unitPrice = dictionary["unitPrice"] as! String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["idBrand"] = idBrand
        dictionary["idCategory"] = idCategory
        dictionary["date"] = date
        dictionary["idProduct"] = idProduct
        dictionary["idSupplier"] = idSupplier
        dictionary["unitPrice"] = unitPrice
        return dictionary
    }
    
    
}
