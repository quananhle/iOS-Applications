//
//  Settings.swift
//  Tip
//
//  Created by Ashley Le on 12/17/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet weak var defaultCustomField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let defaults  = UserDefaults.standard
//
//        defaultCustomField.placeholder = "%"
//
//        if(defaults.value(forKey: "defaultTipIndex") != nil) {
//            defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
//        }
//
//        if(defaults.value(forKey: "defaultCustomText") != nil) {
//            defaultCustomField.text = defaults.object(forKey: "defaultCustomText") as? String
//        }
//        if(defaultTipControl.selectedSegmentIndex == 3) {
//
//            defaultCustomField.isUserInteractionEnabled = true
//            defaultCustomField.backgroundColor = UIColor.white
//        } else
//        {
//            defaultCustomField.isUserInteractionEnabled = false
//            defaultCustomField.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
//
//
//        }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
//    @IBAction func showCustom(_ sender: AnyObject) {
//        if(defaultTipControl.selectedSegmentIndex == 3) {
//            defaultCustomField.isUserInteractionEnabled = true
//            defaultCustomField.backgroundColor = UIColor.white
//            defaultCustomField.becomeFirstResponder()
//        } else
//        {
//            defaultCustomField.isUserInteractionEnabled = false
//            defaultCustomField.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
//            view.endEditing(true)
//        }
//    }
//    
//    @IBAction func updateDefaultTip(_ sender: AnyObject) {
//        
//        let defaults  = UserDefaults.standard
//        
//        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
//        defaults.set(defaultCustomField.text, forKey: "defaultCustomText")
//        defaults.synchronize()
//    }
    
}
