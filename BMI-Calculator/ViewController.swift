//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Aishwarya Shrestha on 16/12/2021.
//


//Author's Name - Aishwarya Shrestha
//Student ID - 301138662
//Date - 17/12/2021

import UIKit
import Firebase

import FirebaseDatabase

class ViewController: UIViewController {

    private let database = Database.database().reference()
    
    
    //username textfield
    @IBOutlet weak var UsernameField: UITextField!
    
    //age textfield
    @IBOutlet weak var AgeField: UITextField!
    
    //gender textfield
    @IBOutlet weak var GenderField: UITextField!
    
    //height textfield
    @IBOutlet weak var HeightField: UITextField!
    
    //weight textfield
    @IBOutlet weak var WeightField: UITextField!
    
    //calculate button
    @IBOutlet weak var CalculateBtn: UIButton!
    
    //save button
    @IBOutlet weak var SaveBtn: UIButton!
    
    //reset button
    @IBOutlet weak var ResetBtn: UIButton!
    //result display
    
    //BMI Score Display
    @IBOutlet weak var ScoreLabel: UILabel!
    
    //BMI Message Display
    @IBOutlet weak var MessageLabel: UILabel!
    
    //toggle
    @IBOutlet weak var ToggleValue: UISegmentedControl!
    
    
    //metric and imperial toggle
    @IBAction func ToggleChange(_ sender: UISegmentedControl) {
    }
    
    //calculate BMI
    @IBAction func CalculateBMI(_ sender: UIButton) {
        self.view.endEditing(true)

        let height = (HeightField.text! as NSString).doubleValue
        let weight = (WeightField.text! as NSString).doubleValue

    
        var BMI = 0.0

        //Toggle metric and imperial
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
        
        //BMI Message

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
    
    
    //reset button
    
    @IBAction func Clear(_ sender: UIButton) {
        UsernameField.text=""
        AgeField.text=""
        GenderField.text=""
        WeightField.text=""
        HeightField.text=""
        
        ScoreLabel.text = ""
        MessageLabel.text = ""
    }
    
    //save button
    @IBAction func StoreBtn(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        ScoreLabel.text = ""
        MessageLabel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "redirect" {
            
            let displayDate = DateFormatter()
            displayDate.dateFormat = "HH:mm:ss"
            
            let date = Date()
            
            displayDate.dateFormat = "dd-MM-yyyy"
            let dateString = displayDate.string(from: date)
        
            //storing to database
        
            
            let firebaseDatabase = database.child("data").setValue(["Username": UsernameField.text!, "Age": AgeField.text!,"Gender": GenderField.text!, "Weight": WeightField.text!, "BMI Score": ScoreLabel.text!, "BMI Message": MessageLabel.text!, "Date": dateString ])
            
            let data = [Data(weight:WeightField.text!, bmi: ScoreLabel.text!, date: dateString)]
        
            let database = segue.destination as! TableViewController
            database.data = data
            
           
        }
    }

}


