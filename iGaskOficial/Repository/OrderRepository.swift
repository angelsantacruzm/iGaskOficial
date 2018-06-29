//
//  OrderRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class OrderRepository {
    var listOfOrders: [OrderModel] = []
    var uploadedOrders: [OrderModel] = []
    
    func addOrderToDatabase(idcustomerord: String, idproductord: String, priceord: String, quantityord: String){
        let key = Database.database().reference().child("orders").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let order = OrderModel.init(dateords: dateString, idcustomerords: idcustomerord, idorderords : key, idproductords: idproductord, priceords: priceord, quantityords: quantityord)
        Database.database().reference().child("orders").child(key).setValue(order.toDictionary())
    }
    
    
    
    
}
