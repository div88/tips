//
//  ViewController.swift
//  tips
//
//  Created by Divya Prabhakar on 9/18/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        taxRateLabel.text = "$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        var taxStatus: NSString = "taxno"
        //defaults.setObject("taxStatusPref", forKey: taxStatus)
        defaults.setInteger(0, forKey: "test")
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var taxRateLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
      //  println("view will appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var rest = defaults.integerForKey("test")
        //var tax = defaults.objectForKey("taxStatusPref") as String
        var intValue = defaults.integerForKey("taxStatusPref")
        if intValue >= 1 {
            var tipPercentages = [0.18, 0.2, 0.22]
            var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            var billAmount = NSString(string: billField.text).doubleValue
            var tip = billAmount * tipPercentage
            var taxRate = 0.09 * billAmount
            var total = billAmount + tip + taxRate
            
            
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
            taxRateLabel.text = "$\(taxRate)"
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            taxRateLabel.text = String(format: "$%.2f", taxRate)
            
        } else {
            taxRateLabel.text = "Tax Not Included"
        }
        println(intValue)
    }
    
  /*  override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }*/
   
}

