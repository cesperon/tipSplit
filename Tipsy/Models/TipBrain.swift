//
//  ViewController.swift
//  Tipsy
//
//Author: Christian Esperon

import UIKit
import Foundation

struct TipBrain {
    
    //bill model to hold bill properties
    var bill:Bill?
    
    //function used to create bill model from function parameters
    mutating func calculateBill(_ billTotal:Float,_ tax:Float,_ tip:Float,_ split:Float) {
        
        //calculate sales tax given bill and tax percentage
        let salesTax = billTotal * (tax/100)
        //calculate tip tip total
        let tipTotal = tip/100
        //calculate final split total which includes tax and amount of ppl to split bill
        let finalTotal = (billTotal + salesTax + (billTotal*tipTotal))/split
        //create bill model 
        bill = Bill(finalBill: finalTotal, splitNumber: split, tipPercent: tip, tax: tax)
        
    }
    
    //getter functions for bill model
    func getFinalTotal() -> String {
        
        return String(format: "%.2f", bill?.finalBill ?? 0.0)
    }
    
    func getSplitNumber() -> String {
        
        return String(Int(bill?.splitNumber ?? 0.0))
    }
    
    func getTip() -> String {
        
        return String(Int(bill?.tipPercent ?? 0.0))
    }
    
    func getTax() -> String {
        
        return String(bill?.tax ?? 0.0)
    }
}
