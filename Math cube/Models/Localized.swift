//
//  Localized.swift
//  Math cube
//
//  Created by Kuts, Andrey on 7/31/19.
//

import Foundation

func localized(_ string: String) -> String {
    return NSLocalizedString(string, tableName: nil, bundle: Bundle.main, value: string, comment: string);
}
