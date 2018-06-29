//
//  BrandRepository.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BrandRepository {
    var listOfBrands: [BrandModel] = []
    var uploadedBrands: [BrandModel] = []
    
    func addBrandModelToDatabase(namebrandBrand: String){
        let key = Database.database().reference().child("brands").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let brands = BrandModel.init(idBrandbrand : key, datebrand: dateString, namebrand: namebrandBrand)
        Database.database().reference().child("brands").child(key).setValue(brands.toDictionary())
    }
    
    
    
    
}
