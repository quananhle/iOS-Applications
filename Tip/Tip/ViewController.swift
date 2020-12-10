//
//  ViewController.swift
//  Tip
//
//  Created by Ashley Le on 12/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var partyControl: UISegmentedControl!
    @IBOutlet weak var partyNumberTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipCustomSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
    }
    @IBAction func calculateTip(_ sender: UITextField) {
        
        func textField(_ sender: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

            //check if any numbers in the textField exist before editing
            guard let textFieldHasText = (sender.text), !textFieldHasText.isEmpty else {
                //early escape if nil
                return true
            }
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            //remove any existing commas
            let textRemovedCommma = sender.text?.replacingOccurrences(of: ",", with: "")
            //update the textField with commas
            let formattedNum = formatter.string(from: NSNumber(value: Int(textRemovedCommma!)!))
            sender.text = formattedNum
            return true
        }
        
        //get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        //calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    @IBAction func partySize(_ sender: Any) {
//        if partyControl.selectedSegmentIndex == 0 {
//            partyNumberTextField.isEnabled = true
//        }
//        else {
//            partyNumberTextField.isEnabled = false
//        }
    }
}
extension String {
    var digitsOnly: String {
        return components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
    }
}


