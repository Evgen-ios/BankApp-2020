//
//  BalanceViewController.swift
//  BankApp 2020
//
//  Created by Evgeniy Goncharov on 03.12.2020.
//

import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet weak var balanceLable: UILabel!
    
    var balance = 0 {
        didSet {
            balanceLable?.text = "\(balance) ₽"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalance()
        
    }
    
    func updateBalance() {
        balance = Int.random(in: 0 ... 1_000_000)
    }


}

