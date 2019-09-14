//
//  BaseNavController.swift
//  Math cube
//
//  Created by Kuts, Andrey on 7/31/19.
//

import UIKit

class BaseNavController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return false
    }
}
