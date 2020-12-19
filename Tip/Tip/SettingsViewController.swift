//
//  SettingsViewController.swift
//  Tip
//
//  Created by Ashley Le on 12/17/20.
//  Copyright © 2020 Codepath. All rights reserved.
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tipFields = [firstTipField, secondTipField, thirdTipField]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Read the stored tip options, update one of them to the new value,
    // and set it back. Also update the default tip control
    private func changeTipOption(index: Int, newValue: String) {
        let normalizedNewValue = newValue.isEmpty ? "0" : newValue
        let enteredInt = Int(normalizedNewValue)! ?? 0
        let enteredPercent = Double(enteredInt) / 100
        tipOptions[index] = enteredPercent
    }
    
    // Update the colors on the page according to whether the
    // light theme has been selected
    private func updateColors(isLight: Bool) {
        let labels = [tipOptionsLabel]
    }
    
    // TODO: Enforce that the entered values are in the correct order
    // (ie low is less than mid, which is less than high), or re-order
    // them as needed
    @IBAction func onFirstTipChanged(sender: AnyObject) {
        changeTipOption(0, newValue: firstTipField.text!)
    }

    @IBAction func onMidTipChanged(sender: AnyObject) {
        changeTipOption(1, newValue: secondTipField.text!)
    }
    
    @IBAction func onHighTipChanged(sender: AnyObject) {
        changeTipOption(2, newValue: thirdTipField.text!)
    }
    
    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
    }
}
    
