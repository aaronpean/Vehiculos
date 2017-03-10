//
//  carDetailController.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 3/6/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class carDetailController: UIViewController {

    var ID_CARRO: Int32 = 0
    
    @IBOutlet var carName: UILabel!
    @IBOutlet var carImage: UIImageView!
    @IBOutlet var carMarca: UILabel!
    @IBOutlet var carModelo: UILabel!
    @IBOutlet var carProd: UILabel!
    @IBOutlet var carCompra: UILabel!
    @IBOutlet var carCap: UILabel!
    @IBOutlet var CarNE: UILabel!
    @IBOutlet var carPrecio: UILabel!
    @IBOutlet var carMoneda: UILabel!
    @IBOutlet var carMatricula: UILabel!
    @IBOutlet var carTipo: UILabel!
    @IBOutlet var carOdometro: UILabel!
    @IBOutlet var carEncargado: UILabel!
    
    let db = DatabaseHelper()
    var carro: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carro = db.getCarByID(id: ID_CARRO)
        //carImage.image = UIImage(named: carro.getPhoto_Uri())
        carName.text = carro.getName()
        carMarca.text = carro.getBrand()
        carModelo.text = carro.getModel()
        carProd.text = carro.getProduction_Date()
        carCompra.text = carro.getPurchase_Date()
        carCap.text = String(carro.getEngine_Capacity())
        CarNE.text = carro.getColor()
        carPrecio.text = String(carro.getPrice())
        carMoneda.text = carro.getPrice_Currency()
        carMatricula.text = carro.getVin()
        carTipo.text = carro.getBody_Type()
        carOdometro.text = String(carro.getOdometer())
        carEncargado.text = carro.getCommet()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
