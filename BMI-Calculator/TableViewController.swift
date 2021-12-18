//
//  TableViewController.swift
//  BMI-Calculator
//
//  Created by Aishwarya Shrestha on 17/12/2021.
//

//Author's Name - Aishwarya Shrestha
//Student ID - 301138662
//Date - 17/12/2021

import UIKit
import Firebase
import FirebaseDatabase

class TableViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    var data = [Data]()
}

extension TableViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table cell", for: indexPath) as! TableUICell
        let value = data[indexPath.row]
      
        
        cell.set(weight: value.weight, bmi: value.bmi, date: value.date)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //animates a deselction of selected item then navigates to second page
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "data", sender: data[indexPath.row])
    }
    
    
    //adding delete gestures
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


