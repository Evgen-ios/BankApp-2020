//
//  LoanViewController.swift
//  BankApp 2020
//
//  Created by Evgeniy Goncharov on 07.12.2020.
//

import UIKit

class LoanViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var pvTextField: UITextField!
    @IBOutlet weak var nperTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var monthlyPaymentLable: UILabel!

    // MARK: - Inherited Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMontlyPaymentLable()
    }
    
    // MARK: - Methods
    
    func updateMontlyPaymentLable() {
        
        monthlyPaymentLable.text = nil
        
        guard let nper = Double(nperTextField.text ?? "") else { return }
        guard let pv = Double(pvTextField.text ?? "") else { return }
        guard let rate = Double(rateTextField.text ?? "") else { return }
        
        let mouthlyPayment = abs(ExcelFormulas.pmt(rate: rate, nper: nper, pv: pv))
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        guard let monthlyPaymentText = formatter.string(from: NSNumber(value: mouthlyPayment)) else { return }
        
    
        monthlyPaymentLable.text = "  Ежемесячный платеж: \( monthlyPaymentText)"
    }
    
    // MARK: - Action
    @IBAction func fieldEditendChange(_ sender: UITextField) {
        updateMontlyPaymentLable()
    }
    
}
