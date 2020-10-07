//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by chrise on 10/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
