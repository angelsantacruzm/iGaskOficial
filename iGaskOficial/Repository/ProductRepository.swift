//
//  ProductRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/26/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class ProductRepository {
    var listOfProducts: [ProductModel] = []
    var uploadedProductos: [ProductModel] = []
    
    func addProducToDatabase(idbrandprod: String, idcategoryprod: String, idsupplierprod: String, unitpriceprod: String) {
        let key = Database.database().reference().child("products").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let product = ProductModel.init(idproductprods : key, idbrandprods: idbrandprod, idcategoryprods: idcategoryprod, idsupplierprods: idsupplierprod, unitpriceprods: unitpriceprod, dateprods: dateString)
        Database.database().reference().child("products").child(key).setValue(product.toDictionary())
    }
    
    
    
    
}
