//
//  SalesModel.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import SwiftyJSON
class SalesModel {

    var idSales : String
    var amount : String
    var date : String
    var idOrder : String

    init() {
        idSales = ""
        amount = ""
        date = ""
        idOrder = ""
}

    init(idsales : String, amountsales: String, datesales: String, idordersales: String){
        idSales = idsales
        amount = amountsales
        date = datesales
        idOrder = idordersales
}

    init(from dictionary: [String: Any]) {
        idSales = dictionary["idSales"] as! String
        amount = dictionary["amount"] as! String
        date = dictionary["date"] as! String
        idOrder = dictionary["idOrder"] as! String
}

    func toDictionary() -> [String: Any] {
        var dictionary = [String :Any]()
        dictionary["idSales"] = idSales
        dictionary["amount"] = amount
        dictionary["date"] = date
        dictionary["idOrder"] = idOrder
        return dictionary
}


}
