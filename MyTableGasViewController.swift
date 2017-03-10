//
//  MyTableGasViewController.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 07/03/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit
import AssetsLibrary

class MyTableGasViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var txtVehicleKey: UITextField!
    @IBOutlet var txtOdometro: UITextField!
    @IBOutlet var txtGasolinera: UITextField!
    @IBOutlet var dtpProduccion: UIDatePicker!
    @IBOutlet var txtTipoGasolina: UITextField!
    @IBOutlet var txtPrecioLitro: UITextField!
    @IBOutlet var txtTotal: UITextField!
    @IBOutlet var txtLitros: UITextField!
    @IBOutlet var txtEncargado: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.jj
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func addCargaGas(_ sender: UIButton) {
        //self.dismiss(animated: true, completion: nil);
        if txtVehicleKey.text != "" && txtOdometro.text != "" && txtGasolinera.text != "" && txtTipoGasolina.text != "" && txtPrecioLitro.text != "" && txtTotal.text != "" && txtLitros.text != "" && txtEncargado.text != "" {
            let formato = DateFormatter()
            formato.dateFormat = "dd/MM/yyyy"
            let carga = Expenses()
            carga.setVehicle_Key(vehicle_key: txtVehicleKey.text!)
            carga.setOdometer(odometer: Int((txtOdometro.text! as NSString).intValue))
            carga.setGas_Station(gas_station: txtGasolinera.text!)
            carga.setDate(date: formato.string(from: dtpProduccion.date))
            carga.setGasoline_Type(gasoline_type: txtTipoGasolina.text!)
            carga.setPrice_Per_1_Liter(price_per_1_liter: Float((txtPrecioLitro.text! as NSString) as String)!)
            carga.setFull_Sum(full_Sum: Float((txtTotal.text! as NSString) as String)!)
            carga.setLiters(liters: Float((txtLitros.text! as NSString) as String)!)
            carga.setComment(comment: txtEncargado.text!)

            let db = DatabaseHelper()
            db.initDB()
            if !db.doExisteCargaGas(vehicle_key: carga.getVehicle_Key()){
                if db.createExpense(expense: carga){
                    //errorDialog(error: "El carro fue agregado exitosamente.")
                    db.closeDB()
                    self.performSegue(withIdentifier: "unwindToThisViewController", sender: self)
                }
                else{
                    errorDialog(error: "Hubo un error al agregar la carga, vuelva a intentarlo.")
                }
            }
            else{
                errorDialog(error: "Ya existe una carga con ese dato, cambielo.")
            }
            db.closeDB()
        }
        else{
            let campo = (txtVehicleKey.text == "" ? "Clave Vehiculo" : (txtOdometro.text == "" ? "Odometro" : (txtGasolinera.text == "" ? "Gasolinera" : (txtTipoGasolina.text == "" ? "Tipo de gasolina" : (txtPrecioLitro.text == "" ? "Precio por litro" : (txtTotal.text == "" ? "Suma Total" : (txtLitros.text == "" ? "Litros" : (txtEncargado.text == "" ? "Encargado" : ""))))))))
            errorDialog(error: "El campo " + campo + " es obligatorio")
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Insert your save data statements in this function
     print("Insert your save data statements in this function")
     
     }*/
    
    
    
    func errorDialog(error: String){
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
        //UIAlertView(title: "Error", message: error,delegate: nil,cancelButtonTitle: "Ok").show()
    }
    
    
}
