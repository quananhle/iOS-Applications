//
//  ViewController.swift
//  Tip
//
//  Created by Ashley Le on 12/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var textField: UITextField!
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if ((string == "0" || string == "") && (textField.text! as NSString).range(of: ".").location < range.location) {
             return true
         }

         // First check whether the replacement string's numeric...
         let cs = NSCharacterSet(charactersIn: "0123456789.").inverted
         let filtered = string.components(separatedBy: cs)
         let component = filtered.joined(separator: "")
         let isNumeric = string == component

         // Then if the replacement string's numeric, or if it's
         // a backspace, or if it's a decimal point and the text
         // field doesn't already contain a decimal point,
         // reformat the new complete number using
         if isNumeric {
             let formatter = NumberFormatter()
             formatter.numberStyle = .decimal
             formatter.maximumFractionDigits = 8
             // Combine the new text with the old; then remove any
             // commas from the textField before formatting
             let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
             let numberWithOutCommas = newString.replacingOccurrences(of: ",", with: "")
             let number = formatter.number(from: numberWithOutCommas)
             if number != nil {
                 var formattedString = formatter.string(from: number!)
                 // If the last entry was a decimal or a zero after a decimal,
                 // re-add it here because the formatter will naturally remove
                 // it.
                 if string == "." && range.location == textField.text?.count {
                     formattedString = formattedString?.appending(".")
                 }
                 textField.text = formattedString
             } else {
                 textField.text = nil
             }
         }
         return false
     }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
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


