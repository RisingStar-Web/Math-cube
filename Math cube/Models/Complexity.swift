//
//  Complexity.swift
//  Math cube
//
//  Created by Kuts, Andrey on 7/31/19.
//

import Foundation

enum Complexity: UInt8 {
    case  twoDigits = 0, threeDigits, forDigits, line, square, rectangle, bigSquare
    
    func rule() -> String {
        switch self {
        case .line:
            return "grp.cifrico_line"
        case .twoDigits:
            return "grp.cifrico_2d"
        case .threeDigits:
            return "grp.cifrico_3d"
        case .forDigits:
            return "grp.cifrico_4d"
        case .square:
            return "grp.cifrico_square_2x2"
        case .rectangle:
            return "grp.cifrico_rectangle_2x3"
        case .bigSquare:
            return "grp.cifrico_square_3x3"
        }
    }
}
