//
//  MainVC.swift
//  window-shopper
//
//  Created by juger on 6/5/19.
//  Copyright © 2019 juger. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //Outlets -:
    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9481662889, green: 0.5439067311, blue: 0.005795938937, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        
    }
    
    @objc func calculate(){
        view.endEditing(true)
        if let wageTxt = wageTxt , let priceTxt = priceTxt {
            if let wage = Double(wageTxt.text!) , let price = Double(priceTxt.text!) {
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
        
    }

    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
}

