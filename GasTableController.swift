//
//  GasTableController.swift
//  Vehiculos
//
//  Created by Aaron Alvarez on 07/03/17.
//  Copyright © 2017 Aarón Gabriel Álvarez Armienta. All rights reserved.
//

import UIKit

class GasTableController: UITableViewController{
    
    var cargas = [Expenses]()
    var selectedRow: GasTableCell = GasTableCell()
    
    @IBOutlet var tbvCargas: UITableView!
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = DatabaseHelper()
        db.initDB()
        cargas = db.getGasList()
        db.closeDB()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let db = DatabaseHelper()
        db.initDB()
        cargas = db.getGasList()
        db.closeDB()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return cargas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            self.tableView.dequeueReusableCell(withIdentifier:
                "GasTableCell", for: indexPath)
                as! GasTableCell
        
        let row = indexPath.row
        cell.expenseVehicleKey.text = String(cargas[row].COLUMN_VEHICLE_KEY)
        cell.expenseFullSum.text = String(format:"%.2f", cargas[row].COLUMN_FULL_SUM)
        cell.expenseLiters.text = String(format:"%.2f", cargas[row].COLUMN_LITERS)
        cell.expenseDate.text = cargas[row].COLUMN_DATE
        cell.expenseComment.text = cargas[row].COLUMN_COMMENT
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gasDetailSegue"{
            let cell = self.tableView.cellForRow(at: self.tableView.indexPathForSelectedRow!) as! GasTableCell
            //let cell = self.tableView.dequeueReusableCell(withIdentifier: "CarTableCell", for: self.tableView.indexPathForSelectedRow!) as! CarTableCell
            let destinationVC = segue.destination as! gasDetailController
            destinationVC.ID_CARGA = (cell.expenseVehicleKey.text!  as NSString).intValue
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
