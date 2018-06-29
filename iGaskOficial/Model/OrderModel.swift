//
//  OrderModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON
class OrderModel {
    
    var date: String
    var idCustomer: String
    var idOrder: String
    var idProduct: String
    var price: String
    var quantity: String
    
    init() {
        
        date = ""
        idCustomer = ""
        idOrder = ""
        idProduct = ""
        price = ""
        quantity = ""
    }
    
    init(dateords : String, idcustomerords: String, idorderords: String, idproductords: String, priceords: String, quantityords: String){
        date = dateords
        idCustomer = idcustomerords
        idOrder = idorderords
        idProduct = idproductords
        price = priceords
        quantity = quantityords
    }
    
    init(from dictionary: [String: Any]) {
        idCustomer = dictionary["idCustomer"] as! String
        idOrder = dictionary["idOrder"] as! String
        idProduct = dictionary["idProduct"] as! String
        price = dictionary["price"] as! String
        quantity = dictionary["quantity"] as! String
        date = dictionary["date"] as! String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["idCustomer"] = idCustomer
        dictionary["idOrder"] = idOrder
        dictionary["idProduct"] = idProduct
        dictionary["price"] = price
        dictionary["quantity"] = quantity
        dictionary["date"] = date
        return dictionary
    }
    
    
}
