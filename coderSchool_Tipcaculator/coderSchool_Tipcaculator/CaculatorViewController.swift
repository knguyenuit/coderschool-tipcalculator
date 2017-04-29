//
//  CaculatorViewController.swift
//  coderSchool_Tipcaculator
//
//  Created by Khanh Nguyen on 4/28/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class CaculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldBillAmount: UITextField!
    @IBOutlet weak var containerPercentage: UIView!
    @IBOutlet weak var containerCurrency: UIView!
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var buttonLowPercent: UIButton!
    @IBOutlet weak var buttonMediumPercent: UIButton!
    @IBOutlet weak var buttonHighPercent: UIButton!
    @IBOutlet weak var buttonCurrency1: UIButton!
    @IBOutlet weak var buttonCurrency2: UIButton!
    @IBOutlet weak var buttonCurrency3: UIButton!
    
    var currentPercent = 0.0
    var currentRate = 0.0
    var totalBill = 0.0
    var billAmount = 0.0
    var tip = 0.0
    var currentCurrency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldBillAmount.delegate = self
        textFieldBillAmount.text = "0"
        
        containerPercentage.layer.borderColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1).cgColor
        containerPercentage.layer.borderWidth = 1
        containerPercentage.layer.cornerRadius = 2
        
        containerCurrency.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
        containerCurrency.layer.borderWidth = 1
        containerCurrency.layer.cornerRadius = 2
        
        
        currentPercent = Global.percentLow
        buttonLowPercent.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        currentCurrency = Global.currency1
        buttonCurrency1.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
                       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        buttonLowPercent.setTitle("\(Int(Global.percentLow * 100))%", for: .normal)
        print(Global.percentLow * 100)
        buttonMediumPercent.setTitle("\(Int(Global.percentMedium * 100))%", for: .normal)
        buttonHighPercent.setTitle("\(Int(Global.percentHigh * 100))%", for: .normal)
        
        buttonCurrency1.setTitle("\(Global.currency1)", for: .normal)
        buttonCurrency2.setTitle("\(Global.currency2)", for: .normal)
        buttonCurrency3.setTitle("\(Global.currency3)", for: .normal)
        
        currentPercent = Global.currentPercent
        currentRate = Global.currentRate
        billAmount = billAmount / Global.oldRate
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Double(string) != nil{
            billAmount = Double(textField.text! + string)!
            caculateBillAmount(billAmount: billAmount)
            //changeCurrency()
        }
        return true
    }
    
    func caculateBillAmount(billAmount: Double){
        tip = billAmount * currentPercent
        totalBill = billAmount + tip
        labelTip.text = String.init(format: "%.2f \(currentCurrency)", tip)
        labelTotal.text = String.init(format: "%.2f \(currentCurrency)", totalBill)
    }
    
    func changeCurrency(){
        if currentCurrency == Global.currency1{
            currentRate = Global.rateCurrency1
        }
        if currentCurrency == Global.currency2{
            currentRate = Global.rateCurrency2
        }
        if currentCurrency == Global.currency3{
            currentRate = Global.rateCurrency3
        }
        billAmount = billAmount * currentRate

        caculateBillAmount(billAmount: billAmount)
        textFieldBillAmount.text = String.init(format: "%.2f", billAmount)
    }
    
    
    @IBAction func buttonLowPercentClick(_ sender: Any) {
        Global.currentButtonPercent = 1
        currentPercent = Global.percentLow
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonLowPercent.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonMediumPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonHighPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
   
    @IBAction func buttonMediumPercentClick(_ sender: Any) {
        Global.currentButtonPercent = 2
        currentPercent = Global.percentMedium
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonMediumPercent.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonLowPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonHighPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func buttonHighPercentClick(_ sender: Any) {
        Global.currentButtonPercent = 3
        currentPercent = Global.percentHigh
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonHighPercent.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonMediumPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonLowPercent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)    }
    
    @IBAction func buttonCurrency1Click(_ sender: Any) {
        Global.currentButtonRate = 1
        currentCurrency = Global.currency1
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonCurrency1.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonCurrency2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonCurrency3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func buttonCurrency2Click(_ sender: Any) {
        Global.currentButtonRate = 2
        currentCurrency = Global.currency2
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonCurrency2.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonCurrency1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonCurrency3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func buttinCurrency3Click(_ sender: Any) {
        Global.currentButtonRate = 3
        currentCurrency = Global.currency3
        caculateBillAmount(billAmount: billAmount)
        changeCurrency()
        buttonCurrency3.backgroundColor = #colorLiteral(red: 0.4757906199, green: 0.8400751948, blue: 0.9774387479, alpha: 1)
        buttonCurrency1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonCurrency2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoSetting" {
            if let destination = segue.destination as? SettingTableViewController {
                destination.currentPercent = self.currentPercent
                destination.oldRate = currentRate
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
