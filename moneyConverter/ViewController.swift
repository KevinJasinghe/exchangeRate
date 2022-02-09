//
//  ViewController.swift
//  moneyConverter
//
//  Created by Kevin Jasinghe on 2022-02-08.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureTapGesture()
    }
    
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
  @objc func handleTap () {
      view.endEditing(true)
    }
    
    private func configureTextField(){
        textField.delegate = self
    }
    
    
    
    @IBAction func buttonTap(_ sender: Any) {
        let orginalInput = textField.text!
        let moneyInputted = textField.text!
        let moneyDouble = Double(moneyInputted)
       let exchange = calculateExchangeRate(userInput: moneyDouble!)
        textView.text = "The exchange rate for \(orginalInput) Canadian Dollars is \(exchange) US dollars"
    }
    func calculateExchangeRate(userInput money:Double) -> Double{
        let USDollar = money * 0.79
        return USDollar
    }
    
}

//Designs so hitting return key hides the keyboard
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
