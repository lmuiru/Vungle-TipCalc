//
//  ViewController.swift
//  TipCalculator
//
//  Created by Main Account on 9/15/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var totalTextField : UITextField!
  @IBOutlet var taxPctSlider : UISlider!
  @IBOutlet var taxPctLabel : UILabel!
  @IBOutlet var resultsTextView : UITextView!
    
    @IBAction func VideoAds(sender: UIButton) {
        let sdk = VungleSDK.sharedSDK()
        sdk.playAd(self)
    }
  let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
  func refreshUI() {
    // 1
    totalTextField.text = String(format: "%0.2f", tipCalc.total)
    // 2
    taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
    // 3
    taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
    // 4
    resultsTextView.text = ""
  }
    

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    refreshUI()
    //play add
    //let sdk = VungleSDK.sharedSDK()
    

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func calculateTapped(sender : AnyObject) {
    // 1
    tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
    // 2
    let possibleTips = tipCalc.returnPossibleTips()
    var results = ""
    // 3
    var keys = Array(possibleTips.keys)
    keys.sortInPlace()
    for tipPct in keys {
      let tipValue = possibleTips[tipPct]!
      let prettyTipValue = String(format:"%.2f", tipValue)
      results += "\(tipPct)%: \(prettyTipValue)\n"
    }
    // 5
    resultsTextView.text = results
  }

  @IBAction func taxPercentageChanged(sender : AnyObject) {
    tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
    refreshUI()
  }
  
  @IBAction func viewTapped(sender : AnyObject) {
    totalTextField.resignFirstResponder()
  }
  
}

