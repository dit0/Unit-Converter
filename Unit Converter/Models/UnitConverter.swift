//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Diego Rodrigues de Oliveira on 1/21/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

class UnitConverter {
    
    func degreesFarenheit(degreesCelcius: Int) -> Int {
        return Int(1.8 * Float(degreesCelcius) + 32.0)
        
    }
    
    func farenheitDegrees(degreedFarenheit: Int) -> Int {
        return Int((Float(degreedFarenheit) - 32.0 ) * 5.0 / 9.0)
    }
}
