//
//  GasTableCell.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 07/03/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class GasTableCell: UITableViewCell {
    
    @IBOutlet var expenseVehicleKey: UILabel!
    @IBOutlet var expenseFullSum: UILabel!
    @IBOutlet var expenseLiters: UILabel!
    @IBOutlet var expenseComment: UILabel!
    @IBOutlet var expenseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
