//
//  ViewController.swift
//  UIKITFirstHomeWorkTBC
//
//  Created by MacBook Air on 03.04.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var headText: UILabel!
    @IBOutlet var switcher: UISwitch!
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var returnedLabel: UILabel!
    @IBOutlet var darkWhite: UISwitch!
    @IBOutlet var mainLabel: UILabel!
    
    @IBAction func changeTheme(_ sender: UISwitch) {
        
        if sender.isOn {
            view.backgroundColor = .darkGray
            headText.textColor = .white
            mainLabel.textColor = .white
            returnedLabel.textColor = .white
        } else {
            view.backgroundColor = .white
            headText.textColor = .black
            mainLabel.textColor = .black
            returnedLabel.textColor = .black
        }
    }
    
    @IBAction func changeFunction(_ sender: UISwitch) {
        if sender.isOn {
            headText.text = "უდიდესი საერთო გამყოფი"
            submitButton.backgroundColor = .green
        } else {
            headText.text = "უმცირესი საერთო ჯერადი"
            submitButton.backgroundColor = .red
        }
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        guard let firstNumber = Int(firstTextField.text ?? ""), let secondNumber = Int(secondTextField.text ?? "") else {
            handleErrors()
            return
        }
        
        if switcher.isOn {
            let gcd = GCD(firstNumber, secondNumber)
            returnedLabel.text = "პასუხი: \(gcd)"
        } else {
            let lcm = LCM(firstNumber, secondNumber)
            returnedLabel.text = "პასუხი: \(lcm)"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.backgroundColor = .red
        
    }
   
      func GCD(_ a: Int, _ b: Int) -> Int {
          return b == 0 ? a : GCD(b, a % b)
      }
      
      
      func LCM(_ a: Int, _ b: Int) -> Int {
          return (a * b) / GCD(a, b)
      }
   
    func handleErrors() {
        if let text = firstTextField.text, !text.isEmpty, Int(text) == nil {
            firstTextField.backgroundColor = .red
        } else {
            firstTextField.backgroundColor = .clear
        }
        
        if let text = secondTextField.text, !text.isEmpty, Int(text) == nil {
            secondTextField.backgroundColor = .red
        } else {
            secondTextField.backgroundColor = .clear
        }
    }

}

