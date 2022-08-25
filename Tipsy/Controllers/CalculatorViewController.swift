//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var numberOfPeople = 2
    var tip = 0.0
    var bilTotal = 0.0
    var resultTo2Decimal = "0.0"
    
    @IBOutlet weak var billTextFied: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    
    
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        
        billTextFied.endEditing(true)
        //Deselect all tip buttons via IBOutlets
              zeroPctButton.isSelected = false
              tenPctButton.isSelected = false
              twentyPctButton.isSelected = false
              
              //Make the button that triggered the IBAction selected.
              sender.isSelected = true
              
              //Get the current title of the button that was pressed.
              let buttonTitle = sender.currentTitle!
              
              //Remove the last character (%) from the title then turn it back into a String.
              let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
              
              //Turn the String into a Double.
              let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
              
              //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
              tip = buttonTitleAsANumber / 100
        
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value, round it down to a whole number then set it as the text in
            //the splitNumberLabel
            splitNumberLabel.text = String(format: "%.0f", sender.value)
            
            //Set the numberOfPeople property as the value of the stepper as a whole number.
            numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bil = billTextFied.text!
        
        if bil != ""{
            
            bilTotal = Double(bil)!
            
            let result = ((bilTotal*tip)+bilTotal)/Double(numberOfPeople)
            
             resultTo2Decimal = String(format: "%.2f", result)
            
            
            performSegue(withIdentifier: "showResult", sender: self)
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "showResult" {
            let destinationVc = segue.destination as! ResultsViewController
            destinationVc.result = resultTo2Decimal
            destinationVc.tip = Int(tip*100)
            destinationVc.split = numberOfPeople
            
        }
    }
    
}

