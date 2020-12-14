//
//  ViewController.swift
//  Tip
//
//  Created by Ashley Le on 12/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UITextFieldDelegate {
class ViewController: UIViewController{
    
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
//        partyNumberTextField.delegate = self
//        billAmountTextField.delegate = self
        partyNumberTextField.isUserInteractionEnabled = false
        partyNumberTextField.backgroundColor = UIColor.lightGray
    }
    /*
    func textField(_ billAmountTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((string == "0" || string == "") && (billAmountTextField.text! as NSString).range(of: ".").location < range.location) {
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
            let newString = (billAmountTextField.text! as NSString).replacingCharacters(in: range, with: string)
            let numberWithOutCommas = newString.replacingOccurrences(of: ",", with: "")
            let number = formatter.number(from: numberWithOutCommas)
            if number != nil {
                var formattedString = formatter.string(from: number!)
                // If the last entry was a decimal or a zero after a decimal,
                // re-add it here because the formatter will naturally remove
                // it.
                if string == "." && range.location == billAmountTextField.text?.count {
                    formattedString = formattedString?.appending(".")
                }
                billAmountTextField.text = formattedString
            } else {
                billAmountTextField.text = nil
            }
        }
        return false
    }
     */
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tipAmount = bill * tipPercentages[tipControl.selectedSegmentIndex]
        //calculate tip and total
        let total = bill + tipAmount
        //update the tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        tipPercentageLabel.text = String(format: "%.2f", tipPercentages[tipControl.selectedSegmentIndex] * 100)+"%"
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func partySize(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let party = Int(partyNumberTextField.text!) ?? 0
        let partySize = [false, true]
        if bill != 0 &&
            true == partySize[partyControl.selectedSegmentIndex]{
            partyNumberTextField.backgroundColor = UIColor.white
            partyNumberTextField.isUserInteractionEnabled = true
        }
        else if bill != 0 && false == partySize[partyControl.selectedSegmentIndex]{
            partyNumberTextField.backgroundColor = UIColor.lightGray
            partyNumberTextField.isUserInteractionEnabled = false
        }
        else {
            partyNumberTextField.backgroundColor = UIColor.lightGray
            partyNumberTextField.isUserInteractionEnabled = false
        }
    }
}
