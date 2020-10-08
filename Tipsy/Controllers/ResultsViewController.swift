//
//  ViewController.swift
//  Tipsy
//
//Author: Christian Esperon

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill: String?
    var splitNumber: String?
    var tipPercent: String?
    var tax: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = totalBill
        
        settingsLabel.text = "Split between " + splitNumber! + " people, with " + tipPercent! + "% tip and " + tax! + "% sales tax"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        //return to previous window by dismissing current window
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
