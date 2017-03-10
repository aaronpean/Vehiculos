//
//  CarTableController.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 3/5/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class CarTableController: UITableViewController{
    
    var carros = [Car]()
    var selectedRow: CarTableCell = CarTableCell()
    
    @IBOutlet var tbvCarros: UITableView!
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = DatabaseHelper()
        db.initDB()
        carros = db.getCarList()
        db.closeDB()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let db = DatabaseHelper()
        db.initDB()
        carros = db.getCarList()
        db.closeDB()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return carros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            self.tableView.dequeueReusableCell(withIdentifier:
                "CarTableCell", for: indexPath)
                as! CarTableCell
        
        let row = indexPath.row
        cell.carImage.image = UIImage(named: carros[row].COLUMN_PHOTO_URI)
        cell.carName.text = carros[row].COLUMN_NAME
        cell.carMarca.text = carros[row].COLUMN_BRAND
        cell.carModel.text = carros[row].COLUMN_MODEL
        cell.carId.text = String(carros[row].COLUMN_ID)
        cell.carCapacidad.text = String(format:"%.2f", carros[row].COLUMN_ENGINE_CAPACITY)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carDetailSegue"{
            let cell = self.tableView.cellForRow(at: self.tableView.indexPathForSelectedRow!) as! CarTableCell
            //let cell = self.tableView.dequeueReusableCell(withIdentifier: "CarTableCell", for: self.tableView.indexPathForSelectedRow!) as! CarTableCell
            let destinationVC = segue.destination as! carDetailController
            destinationVC.ID_CARRO = (cell.carId.text!  as NSString).intValue
            //print(cell.carModel.text)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        //let selectedRow = self.tableView.cellForRow(at: indexPath) as! CarTableCell
        //print(selectedRow.carName.text)
        //self.performSegue(withIdentifier: "carDetailSegue", sender: self)
    }
    
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }*/
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
            print("hola")
    }*/
    
    func errorDialog(error: String){
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
        //UIAlertView(title: "Error", message: error,delegate: nil,cancelButtonTitle: "Ok").show()
    }

    
}
