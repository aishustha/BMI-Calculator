//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Aishwarya Shrestha on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HeightField: UITextField!
    
    @IBOutlet weak var WeightField: UITextField!
    
    @IBOutlet weak var CalculateBtn: UIButton!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var MessageLabel: UILabel!
    
    
    @IBOutlet weak var ToggleValue: UISegmentedControl!
    
    @IBAction func ToggleChange(_ sender: UISegmentedControl) {
    }
    
    @IBAction func CalculateBMI(_ sender: UIButton) {
        self.view.endEditing(true)

        let height = (HeightField.text! as NSString).doubleValue
        let weight = (WeightField.text! as NSString).doubleValue

    
        var BMI = 0.0


        switch ToggleValue.selectedSegmentIndex {
          case 0:
          BMI = 703 * weight/(height*height);
          ScoreLabel.text = String(format: "%.2f", BMI)


          case 1:
          BMI =  weight / (height*height);
              ScoreLabel.text = String(format: "%.2f", BMI)

          default:
              break
      }


        if BMI < 16 {
            MessageLabel.text = "Severe Thinness"
        } else if (BMI >= 16 && BMI < 17) {
            MessageLabel.text = "Moderate Thinness"
        } else if (BMI >= 17 && BMI < 18.5) {
            MessageLabel.text = "Mild Thinness"
        } else if (BMI >= 18.5 && BMI < 25) {
            MessageLabel.text = "Normal"
        } else if (BMI >= 25 && BMI < 30) {
            MessageLabel.text = "Overweight"
        } else if (BMI >= 30 && BMI < 35) {
            MessageLabel.text = "Obese Class I"
        } else if (BMI >= 35 && BMI < 40) {
            MessageLabel.text = "Obese Class II"
        } else if (BMI > 40){
            MessageLabel.text = "Obese Class III"
        } else {
            MessageLabel.text = "Undefined"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        ScoreLabel.text = ""
        MessageLabel.text = ""
    }
}
