//
//  ViewController.swift
//  iCalculator
//
//  Created by Pavan Kumar Gudur Ashok Kumar on 10/11/16.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDisplay: UILabel!
    
    @IBOutlet weak var btnOptEqual: UIButton!
    @IBOutlet weak var btnOptPlus: UIButton!
    @IBOutlet weak var btnOptMinus: UIButton!
    @IBOutlet weak var btnOptMultiply: UIButton!
    @IBOutlet weak var btnOptDivision: UIButton!

    @IBOutlet weak var btnOptPercent: UIButton!
    @IBOutlet weak var btnOptReversion: UIButton!
    @IBOutlet weak var btnOptClear: UIButton!
    
    @IBOutlet weak var btnNum0: UIButton!
    @IBOutlet weak var btnNum1: UIButton!
    @IBOutlet weak var btnNum2: UIButton!
    @IBOutlet weak var btnNum3: UIButton!
    @IBOutlet weak var btnNum4: UIButton!
    @IBOutlet weak var btnNum5: UIButton!
    @IBOutlet weak var btnNum6: UIButton!
    @IBOutlet weak var btnNum7: UIButton!
    @IBOutlet weak var btnNum8: UIButton!
    @IBOutlet weak var btnNum9: UIButton!
    @IBOutlet weak var btnNumPoint: UIButton!
    
    var orignalNamber: Double! = 0.0
    var operation: String! = ""
    var isTypingNumber: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDisplay.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func clearTapped(sender: AnyObject) {
        lblDisplay.text = "0.0"
        self.operation = ""
        self.orignalNamber = 0.0
        
    }
    
    @IBAction func equalsTapped(sender: AnyObject) {
        
        isTypingNumber = false
        if self.operation != "" {
            doCalculation()
            
        }
        
    }
    
    @IBAction func numberTapped(sender: AnyObject) {
        
        if lblDisplay.text?.characters.count > 12 {
            return
        }
        
        if isTypingNumber {
            lblDisplay.text = (Int(lblDisplay.text!) == 0) ? sender.currentTitle!! : lblDisplay.text! + sender.currentTitle!!
        } else {
            lblDisplay.text = sender.currentTitle!!
            isTypingNumber = true
        }
    }
    
    @IBAction func pointTapped(sender: AnyObject) {
        
        if (lblDisplay.text?.rangeOfString(".")) != nil {
            return
        }
        
        if isTypingNumber {
            lblDisplay.text = lblDisplay.text! + "."
        } else {
            lblDisplay.text = "0."
            isTypingNumber = true
        }
    }
    
    @IBAction func operatorTapped(sender: AnyObject) {
        
        self.operation = sender.currentTitle!
            
        if self.operation == "+/-" {
            self.lblDisplay.text = "\(Double(self.lblDisplay.text!)! * (-1))"
            self.operation = ""
                
        } else if self.operation == "%" {
            self.lblDisplay.text = "\(Double(self.lblDisplay.text!)! / 100)"
            self.operation = ""
        } else {
            if self.orignalNamber != 0.0 && isTypingNumber == true {
                self.doCalculation()
            } else {
                self.orignalNamber = Double(self.lblDisplay.text!)
            }
        }
        
        isTypingNumber = false

        
    }
    
    func doCalculation() {
        
        switch self.operation {
        case "+":
            self.orignalNamber = self.orignalNamber + Double(lblDisplay.text!)!
        case "-":
            self.orignalNamber = self.orignalNamber - Double(lblDisplay.text!)!
        case "x":
            self.orignalNamber = self.orignalNamber * Double(lblDisplay.text!)!
        case "/":
            if Int(lblDisplay.text!)! == 0 {
                lblDisplay.text = "Error!!!"
                return
            }
            
            self.orignalNamber = self.orignalNamber / Double(lblDisplay.text!)!
            
        default:
            print("default")
        }
        
        lblDisplay.text = "\(self.orignalNamber)"
        
    }
    
}

