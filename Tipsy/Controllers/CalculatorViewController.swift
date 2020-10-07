//
//  ViewController.swift
//  Tipsy
//
//Author: Christian Esperon

import UIKit
import Foundation

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
   
    @IBOutlet weak var customPctButton: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var taxTextField: UITextField!
    
    
    var calculatedSplit: String?
    var tipPercent: String?
    var tax: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customPctButton.delegate = self
    }
    //change higlighted tip button when it becomes selected
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender.currentTitle == "10%"{
            
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
        }
        else if sender.currentTitle == "20%"{
            
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            
        }
        
    }
    
    //change highlighted tip button when UITextField is selected
    @IBAction func customPressed(_ sender: UITextField) {

                customPctButton.text = sender.text! 
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        //adjust split number text according to sender value
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    //calculate tip according to percentage selected and split number
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tax = Float(billTextField.text!)! * (Float(taxTextField.text!)!/100)
        
        if tenPctButton.isSelected == true {
            
            //(bill+(bill*.10))/splitNumber
            calculatedSplit = String(format: "%.2f" , (Float(billTextField.text!)! + tax! + (Float(billTextField.text!)! * 0.1))/Float(splitNumberLabel.text!)!)
        
            tipPercent = "10%"
            
            print(calculatedSplit ?? "split not calculated")
            
            
        }
        else if twentyPctButton.isSelected == true {
           
            //(bill+(bill*.20))/splitNumber
            calculatedSplit = String(format: "%.2f", (Float(billTextField.text!)! + tax! + (Float(billTextField.text!)! * 0.2))/Float(splitNumberLabel.text!)!)
            
            tipPercent = "20%"
            
            print(calculatedSplit ?? "split not calculated")

        }
        else {
            
            //(bill+(bill*.custom tip %))/splitNumber
            calculatedSplit = String(format: "%.2f", (Float(billTextField.text!)! + tax! + (Float(billTextField.text!)! * Float(customPctButton.text!.prefix(2))! * 0.01))/Float(splitNumberLabel.text!)!)
            
            print(calculatedSplit ?? "split not calculated")
            
            tipPercent = customPctButton.text ?? "no custom tip selected"

        }
        
        //performSeque allows you to transition to desired next slide
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //this function allows us to prepare controller before transition occurs with segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //perfrom check to validate correct controller.
        if segue.identifier == "goToResults" {
            
            //segue.destintion is the viewcontroller that is being segued into.
            //returns a UIViewController and can be narrowed down to ReslutViewController
            //by using as! which is essentially downcasting
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalBill = calculatedSplit ?? "total unavailable"
            destinationVC.splitNumber = splitNumberLabel.text ?? "split amount not available"
            destinationVC.tipPercent = tipPercent ?? "tip percent not available"
            destinationVC.tax = taxTextField.text ?? "tax n/a"
            
        }
    }
    
    
    //hide keyboard when return button is pressed
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        scoreText.resignFirstResponder()
        return true
    }
        

}

