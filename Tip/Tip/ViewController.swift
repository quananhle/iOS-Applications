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
    @IBOutlet weak var partyOfLabel: UILabel!
    @IBOutlet weak var partyNumberTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipCustomSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var paidButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var remainingAmountLabel: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalTipAmount: UILabel!
    
    var bill = 0.0, sliderTip = 0.0, tipAmount = 0.0,
    tipPercentage = 0.0, total = 0.0, splitBill = 0.0,
    remainingAmount = 0.0
    var partySize = 0.0
    var tmpPaidButton = 0.0, tmpUndoButton = 0.0
    let tipPercentages = [0.15, 0.18, 0.2, 0.0]
    var cnt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        partyNumberTextField.delegate = self
//        billAmountTextField.delegate = self
        partyNumberTextField.isUserInteractionEnabled = false
        partyNumberTextField.backgroundColor = UIColor.lightGray
        paidButton.isUserInteractionEnabled = false
        paidButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        undoButton.isUserInteractionEnabled = false
        undoButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
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
        sliderTip = Double(tipCustomSlider.value)
        bill = Double(billAmountTextField.text!) ?? 0
        if tipControl.selectedSegmentIndex == 3 {
            tipCustomSlider.isHidden = false
            tipPercentage = sliderTip / 100
            tipAmount = bill * tipPercentage
        }
        else {
            tipCustomSlider.value = 0
            tipCustomSlider.isHidden = true
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            tipAmount = bill * tipPercentage
        }
        //calculate tip and total
        total = bill + tipAmount
        //update the tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        tipPercentageLabel.text = String(format: "%.2f", tipPercentage * 100) + "%"
        totalLabel.text = String(format: "$%.2f", total)
        
        partySize = Double(partyNumberTextField.text!) ?? 0.0
        splitBill = total / partySize
        if partySize != 0.0{
            splitAmountLabel.text = String(format: "$%.2f", splitBill) + "/pax"
        }
        else {
            splitAmountLabel.text = String(format: "$0.00")
        }
    }
    
    @IBAction func partySize(_ sender: Any) {
        partySize = Double(partyNumberTextField.text!) ?? 0.0
        splitBill = total / partySize
        //get the party size if not nil, else 0
        let isPayingSeparately = [false, true]
        //if bill amount is not 0 and separte is selected
        if true == isPayingSeparately[partyControl.selectedSegmentIndex]{
            partyNumberTextField.backgroundColor = UIColor.white
            partyNumberTextField.isUserInteractionEnabled = true
        }
        else {
            partyNumberTextField.backgroundColor = UIColor.lightGray
            partyNumberTextField.text = ""
            partyNumberTextField.isUserInteractionEnabled = false
        }
        if partySize != 0 && true == isPayingSeparately[partyControl.selectedSegmentIndex]{
            paidButton.isHidden = false
            paidButton.isUserInteractionEnabled = true
            paidButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            undoButton.isHidden = false
            splitBillLabel.isHidden = false
            splitAmountLabel.isHidden = false
            remainingLabel.isHidden = false
            remainingAmountLabel.isHidden = false
            totalTipLabel.isHidden = false
            totalTipAmount.isHidden = false
            
            splitAmountLabel.text = String(format: "$%.2f", splitBill) + "/pax"
        }
        else {
            paidButton.isHidden = true
            undoButton.isHidden = true
            undoButton.isUserInteractionEnabled = false
            undoButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
            splitBillLabel.isHidden = true
            splitAmountLabel.isHidden = true
            remainingLabel.isHidden = true
            remainingAmountLabel.isHidden = true
            totalTipLabel.isHidden = true
            totalTipAmount.isHidden = true
        }
    }
    @IBAction func paidButton(_ sender: UIButton) {
        let numberPeople = Int(partyNumberTextField.text!) ?? 0
        //set variable cnt is partySize once at start and not be reassigned
        if 0 == cnt {
            cnt = numberPeople
        }
        //set tmpPaidButton once at start and not be reassigned
//        if 0.0 == tmpPaidButton{
//            tmpPaidButton = total
//        }
        if 0.0 == remainingAmount{
            remainingAmount = bill * tipAmount
        }
//        remainingAmount = tmpPaidButton - splitBill
        remainingAmount = remainingAmount - splitBill
        if 2 >= cnt {
            remainingAmountLabel.text = String(format: "$%.2f", remainingAmount) + " for " + String(cnt-1) + " pax"
        }
        else {
            remainingAmountLabel.text = String(format: "$%.2f", remainingAmount) + " for " + String(cnt-1) + " ppl"
        }
//        tmpPaidButton = remainingAmount
        if remainingAmount <= 0 {
            paidButton.isUserInteractionEnabled = false
            paidButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        }
        cnt -= 1

    }
    @IBAction func undoButton(_ sender: UIButton) {
        
        if remainingAmount == total {
            undoButton.isUserInteractionEnabled = false
            undoButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        }
        else {
            undoButton.isUserInteractionEnabled = true
            undoButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }

//        remainingAmount = total - splitBill
//        remainingAmountLabel.text = String(format: "$%.2f", remainingAmount)
//        if 0 <= remainingAmount - splitBill {
//            total = remainingAmount
//        }
    }
    
}
//make rounded border button
@IBDesignable extension UIButton {
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
