//
//  ViewController.swift
//  Conversores
//
//  Created by Victor Feitosa on 28/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnitOne: UIButton!
    @IBOutlet weak var btUnitTwo: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnitOne.setTitle("Kilograma", for: .normal)
                btUnitTwo.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnitOne.setTitle("Real", for: .normal)
                btUnitTwo.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnitOne.setTitle("Metro", for: .normal)
                btUnitTwo.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnitOne.setTitle("Celsius", for: .normal)
                btUnitTwo.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnitOne {
                btUnitTwo.alpha = 0.5
            }else{
                btUnitOne.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        }else{
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        }else{
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 3.5)
        }else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
    }
    
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0 {
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distance / 1000.0)
        }else{
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000.0)
        }
    }
    

}

