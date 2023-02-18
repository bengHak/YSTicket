//
//  NumberUtil.swift
//  FoundationKit
//
//  Created by 고병학 on 2023/02/18.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct NumberUtil {
    public static func buildCompressedPrice(_ number: Double) -> (price: String, unit: String) {
        if number / 10000.0 > 1 && Int(number) % 10000 != 0 {
            return ("\(number/10000.0)", "만")
        }
        if number / 10000.0 > 1 && Int(number) % 10000 == 0 {
            return ("\(Int(number/10000))", "만")
        }
        if number / 1000.0 > 1 && Int(number) % 1000 != 0 {
            return ("\(number/1000.0)", "천")
        }
        if number / 1000.0 > 1 && Int(number) % 1000 == 0 {
            return ("\(Int(number/1000))", "천")
        }
        return ("\(Int(number))", "")
    }
    
    public static func buildCompressedNumber(_ number: Int) -> String {
        switch number {
        case 0..<10:
            return "\(number)"
        case 10..<100:
            return "\(Int(Double(number)/10))0+"
        case 100..<1000:
            return "\(Int(Double(number)/100))백+"
        case 1000..<10000:
            return "\(Int(Double(number)/1000))천+"
        default:
            return "\(Int(Double(number)/10000))만+"
        }
    }
}
