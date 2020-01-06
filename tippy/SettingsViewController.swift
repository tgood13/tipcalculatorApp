//
//  SettingsViewController.swift
//  tippy
//
//  Created by Troy Good on 1/4/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var defaultPeopleLabel: UILabel!
    
    @IBOutlet weak var defaultTipStepper: UIStepper!
    
    @IBOutlet weak var defaultPeopleStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // update stepper values to reflect user defaults
        defaultTipStepper.value = UserDefaults.standard.double(forKey: "defaultTipStepperValue")
        
        defaultPeopleStepper.value = UserDefaults.standard.double(forKey: "defaultPeopleStepperValue")
        
        // update tip and people labels to reflect user defaults
        defaultTipLabel.text = String(Int(UserDefaults.standard.double(forKey: "defaultTipStepperValue")))
        
        defaultPeopleLabel.text = String(Int(UserDefaults.standard.double(forKey: "defaultPeopleStepperValue")))
        
        // if label values are zeros, assign them to factory settings and update steppers
        if defaultTipLabel.text == "0" {
            defaultTipLabel.text = "15"
            defaultTipStepper.value = Double(15)
        }
        
        if defaultPeopleLabel.text == "0" {
            defaultPeopleLabel.text = "1"
            defaultPeopleStepper.value = Double(1)
        }
    }
    
    // change default tip percentage and update default tip label; sync defaults once complete
    @IBAction func defaultTipStepper(_ sender: UIStepper) {
        
        UserDefaults.standard.set(sender.value, forKey: "defaultTipStepperValue")
        
        defaultTipLabel.text = String(Int(sender.value))
        
        UserDefaults.standard.synchronize()
    }
    
    // change default # of people and update default tip label; sync defaults once complete
    @IBAction func defaultPeopleStepper(_ sender: UIStepper) {
        
        UserDefaults.standard.set(sender.value, forKey: "defaultPeopleStepperValue")

        defaultPeopleLabel.text = String(Int(sender.value))

        UserDefaults.standard.synchronize()
        
    }
    
}
