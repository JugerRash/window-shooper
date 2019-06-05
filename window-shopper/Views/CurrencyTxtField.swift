//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by juger on 6/5/19.
//  Copyright © 2019 juger. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    
    //Add a currency sign to our textField we have to use draw function to add it and just we use this func to add subviews just adding subviews
    override func draw(_ rect: CGRect) {
        let size : CGFloat = 20 // for the height and the width of currency sign and it must be CGFloat
        let currncyLbl = UILabel(frame: CGRect(x: 5, y: (( frame.height / 2) - (size / 2)), width: size, height: size))
        currncyLbl.backgroundColor = #colorLiteral(red: 0.7295944215, green: 0.7295944215, blue: 0.7295944215, alpha: 1)
        currncyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currncyLbl.textAlignment = .center
        currncyLbl.layer.cornerRadius = 5.0
        currncyLbl.clipsToBounds = true //this one is important to put when u use draw function and u have to use it with every change in ur super view
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current // this to grab the symbol	of ur location country
        currncyLbl.text = formatter.currencySymbol
        addSubview(currncyLbl)
        
    }
    
    override func prepareForInterfaceBuilder() { // to make our changes visiable to us in interface builder
        setupView()
    }
    override func awakeFromNib() { // this one to make sure that every changes will show at the run time
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        textAlignment = .center
        layer.cornerRadius = 5.0
        clipsToBounds = true
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor :#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) ])//variable has a white color for placeholder and u can change alot of things into it
            attributedPlaceholder = place // to make placeholder color white
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
