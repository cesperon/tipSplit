//
//  ViewController.swift
//  Tipsy
//
//Author: Christian Esperon

import UIKit
import Foundation

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    var tipBrain = TipBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
   
    @IBOutlet weak var customPctButton: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var taxTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customPctButton.delegate = self
    }
    
    //change higlighted button when it becomes selected
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
    
    //change highlighted button when UITextField is selected
    @IBAction func customPressed(_ sender: UITextField) {

        customPctButton.text = sender.text! 
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
                        
    }
    
    //change splitNumber label when stepper value is changed
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        //adjust split number text according to sender value
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    //calculate tip according to percentage selected and split number
    @IBAction func calculatePressed(_ sender: UIButton) {
                
        //calculate bill using tipbrain, depends on tip percentage button selected.
        if tenPctButton.isSelected == true {
            
            tipBrain.calculateBill(Float(billTextField.text!)!, Float(taxTextField.text!)!,10, Float(splitNumberLabel.text!)!)
            
        }
        else if twentyPctButton.isSelected == true {
           
            tipBrain.calculateBill(Float(billTextField.text!)!, Float(taxTextField.text!)!,20, Float(splitNumberLabel.text!)!)

        }
        else {
            
            tipBrain.calculateBill(Float(billTextField.text!)!, Float(taxTextField.text!)!,Float(customPctButton.text!)!, Float(splitNumberLabel.text!)!)

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
            
            destinationVC.totalBill = tipBrain.getFinalTotal()
            destinationVC.splitNumber = tipBrain.getSplitNumber()
            destinationVC.tipPercent = tipBrain.getTip()
            destinationVC.tax = tipBrain.getTax()
            
        }
    }
    
    
    //hide keyboard when return button is pressed
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        scoreText.resignFirstResponder()
        return true
    }
        

}

