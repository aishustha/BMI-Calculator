//
//  TableUICell.swift
//  BMI-Calculator
//
//  Created by Aishwarya Shrestha on 17/12/2021.
//

import UIKit

class TableUICell: UITableViewCell {
    @IBOutlet weak var WeightDataLabel: UILabel!
    
    @IBOutlet weak var BMIResultLabel: UILabel!

    @IBOutlet weak var DateLabel: UILabel!
    
    func set(weight:String, bmi:String, date:String){
        WeightDataLabel.text = weight
        BMIResultLabel.text = bmi
        DateLabel.text = date
    }
}
