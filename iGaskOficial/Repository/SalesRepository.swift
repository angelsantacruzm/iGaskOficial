//
//  SalesRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SalesRepository {
    var listOfSales: [SalesModel] = []
    var uploadedSales: [SalesModel] = []
    
    func addSaleToDatabase(amountsale: String, idordersale:String) {
        let key = Database.database().reference().child("sales").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let sale = SalesModel.init(idsales: key, amountsales: amountsale, datesales: dateString, idordersales: idordersale)
        Database.database().reference().child("sales").child(key).setValue(sale.toDictionary())
    }
    
    
    
    
}
