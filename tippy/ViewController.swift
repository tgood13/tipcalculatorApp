//
//  ViewController.swift
//  tippy
//
//  Created by Troy Good on 12/29/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var costField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var tipStepper: UIStepper!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBOutlet weak var totalTipLabel: UILabel!
    
    @IBOutlet weak var totalCostLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set cost field to be first responder
        
        costField.becomeFirstResponder()
        
        // update tip and people stepper values with defaults from Settings
        
        tipStepper.value = UserDefaults.standard.double(forKey: "defaultTipStepperValue")
        peopleStepper.value = UserDefaults.standard.double(forKey: "defaultPeopleStepperValue")
        
        // update tip and people labels with strings created from defaults in Settings
        
        tipLabel.text = String(Int(UserDefaults.standard.double(forKey: "defaultTipStepperValue")))
        peopleLabel.text = String(Int(UserDefaults.standard.double(forKey: "defaultPeopleStepperValue")))
        
        // if label values are zeros, assign them to factory settings and update steppers
        
        if totalTipLabel.text == "0" {
            totalTipLabel.text = "15"
            tipStepper.value = Double(15)
        }
        
        if peopleLabel.text == "0" {
            peopleLabel.text = "1"
            peopleStepper.value = Double(1)
        }
        
        // perform necessary math to calculate tip and total values
        
        let bill = Double(costField.text!) ?? 0
        let tipPercentage = (Double(tipLabel.text!) ?? 0) / 100
        let people = Double(peopleLabel.text!) ?? 1
        let tip = (bill * tipPercentage) / people
        let total = bill + tip * people
        
        // convert tip and total values to appropriate string format
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let tipString = currencyFormatter.string(from: NSNumber(value: tip))!
        let totalString = currencyFormatter.string(from: NSNumber(value: total))!
        
        // update total tip and total cost labels
        
        totalTipLabel.text = tipString
        totalCostLabel.text = totalString
        
        // store bill amount to allow persistence across app restarts
        
        UserDefaults.standard.set(costField.text, forKey: "billAmount")
        
    }
    
    
    // performs necessary calculations to find total tip and total cost
    // this method is called every time a stepper is updated so that screen reflects accurate values
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(costField.text!) ?? 0
        
        let tipPercentage = (Double(tipLabel.text!) ?? 15) / 100
        
        let people = Double(peopleLabel.text!) ?? 1
        
        let tip = (bill * tipPercentage) / people
        
        let total = bill + tip * people
        
        // convert tip and total values to appropriate string format
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let tipString = currencyFormatter.string(from: NSNumber(value: tip))!
        let totalString = currencyFormatter.string(from: NSNumber(value: total))!
        
        // update corresponding labels
        
        totalTipLabel.text = tipString
        totalCostLabel.text = totalString
        
        
    }
    
    // change tip percentage, update tip label, and re-calculate tip
    
    @IBAction func tipStepper(_ sender: UIStepper) {
        
        tipLabel.text = String(Int(sender.value))
        
        calculateTip(sender)
    }
    
    // change # of people, update people label, and re-calculate tip
    
    @IBAction func peopleStepper(_ sender: UIStepper) {
        
        peopleLabel.text = String(Int(sender.value))
        
        calculateTip(sender)
    }
    
}

