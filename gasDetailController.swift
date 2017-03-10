//
//  gasDetailController.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 07/03/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class gasDetailController: UIViewController {
    
    var ID_CARGA: Int32 = 0
    
    @IBOutlet var expenseVehicleKey: UILabel!
    @IBOutlet var expenseOdometer: UILabel!
    @IBOutlet var expenseGasStation: UILabel!
    @IBOutlet var expenseGasolineType: UILabel!
    @IBOutlet var expenseDate: UILabel!
    @IBOutlet var expensePricePer1Liter: UILabel!
    @IBOutlet var expenseFullSum: UILabel!
    @IBOutlet var expenseLiters: UILabel!
    @IBOutlet var expenseComment: UILabel!
    
    let db = DatabaseHelper()
    var carga: Expenses!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carga = db.getGasByID(id: ID_CARGA)
        expenseVehicleKey.text = carga.getVehicle_Key()
        expenseOdometer.text = String(carga.getOdometer())
        expenseGasStation.text = carga.getGas_Station()
        expenseGasolineType.text = carga.getGasoline_Type()
        expenseDate.text = carga.getDate()
        expensePricePer1Liter.text = String(carga.getPrice_Per_1_Liter())
        expenseFullSum.text = String(carga.getFull_Sum())
        expenseLiters.text = String(carga.getLiter())
        expenseComment.text = carga.getComment()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
