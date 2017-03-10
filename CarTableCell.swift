//
//  CarTableCell.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 3/6/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class CarTableCell: UITableViewCell {

    @IBOutlet var carImage: UIImageView!
    
    @IBOutlet var carId: UILabel!
    @IBOutlet var carMarca: UILabel!
    @IBOutlet var carName: UILabel!
    @IBOutlet var carModel: UILabel!
    @IBOutlet var carCapacidad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
