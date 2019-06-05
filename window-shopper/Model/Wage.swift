//
//  Wage.swift
//  window-shopper
//
//  Created by juger on 6/5/19.
//  Copyright © 2019 juger. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage : Double , andPrice price : Double) -> Int {
        return Int(ceil(price / wage))
    }
}
