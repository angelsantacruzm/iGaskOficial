//
//  SearchCell.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/29/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
class SearchCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    func updateValues(fromSupplier supplier: SupplierModel) {
        nameLabel.text = supplier.name
    }
    
}
