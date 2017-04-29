
//
//  SettingTableViewController.swift
//  coderSchool_Tipcaculator
//
//  Created by Khanh Nguyen on 4/28/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var textFieldHighPercent: UITextField!
    @IBOutlet weak var textFieldMediumPercent: UITextField!
    @IBOutlet weak var textFieldLowPercent: UITextField!
    @IBOutlet weak var textFieldRateCurrency3: UITextField!
    @IBOutlet weak var textFieldRateCurrency2: UITextField!
    @IBOutlet weak var textFieldRateCurrency1: UITextField!
    @IBOutlet weak var textFieldCurrency3: UITextField!
    @IBOutlet weak var textFieldCurrency2: UITextField!
    @IBOutlet weak var textFieldCurrency1: UITextField!
    
    var currentPercent = 0.0
    var oldRate = 1.0
    var newRate = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldCurrency1.text = Global.currency1
        textFieldCurrency2.text = Global.currency2
        textFieldCurrency3.text = Global.currency3
        
        textFieldRateCurrency1.text = String(Global.rateCurrency1)
        textFieldRateCurrency2.text = String(Global.rateCurrency2)
        textFieldRateCurrency3.text = String(Global.rateCurrency3)
        
        textFieldLowPercent.text = "\(Int(Global.percentLow * 100))"
        textFieldMediumPercent.text = "\(Int(Global.percentMedium * 100))"
        textFieldHighPercent.text = "\(Int(Global.percentHigh * 100))"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewDidDisappear(_ animated: Bool) {
        Global.currency1 = textFieldCurrency1.text!
        Global.currency2 = textFieldCurrency2.text!
        Global.currency3 = textFieldCurrency3.text!
        
        Global.rateCurrency1 = Double(textFieldRateCurrency1.text!)!
        Global.rateCurrency2 = Double(textFieldRateCurrency2.text!)!
        Global.rateCurrency3 = Double(textFieldRateCurrency3.text!)!
        
        Global.percentLow = Double(textFieldLowPercent.text!)! / 100
        Global.percentMedium = Double(textFieldMediumPercent.text!)! / 100
        Global.percentHigh = Double(textFieldHighPercent.text!)! / 100
        
        if Global.currentButtonPercent == 1{
            Global.currentPercent = Double(textFieldLowPercent.text!)! / 100
        }
        if Global.currentButtonPercent == 2{
            Global.currentPercent = Double(textFieldMediumPercent.text!)! / 100
        }
        if Global.currentButtonPercent == 3{
            Global.currentPercent = Double(textFieldHighPercent.text!)! / 100
        }
        
        if Global.currentButtonRate == 1{
            Global.oldRate = oldRate
            Global.currentRate = Double(textFieldRateCurrency1.text!)!
        }
        if Global.currentButtonRate == 2{
            Global.oldRate = oldRate
            Global.currentRate = Double(textFieldRateCurrency2.text!)!
        }
        if Global.currentButtonRate == 3{
            Global.oldRate = oldRate
            Global.currentRate = Double(textFieldRateCurrency3.text!)!
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

   
}
