//
//  DigitView.swift
//  Math cube
//
//  Created by Kuts, Andrey on 7/31/19.
//

import UIKit

class DigitView: UIView {
    var digit: Int = 0
    var pos: Position = Position(xPos: 0, yPos: 0)
    
    convenience init (frame: CGRect, digit: Int) {
        self.init(frame: frame);
        self.digit = digit;
        
        let index = getRandom(1, max: 4)
        let image = UIImage(named: String(format:"%dk.png", index))
        let imageView = UIImageView(image: image)
        imageView.frame.origin = CGPoint(x: 1,y: 1)
        imageView.frame.size = CGSize(width: frame.width - 2, height: frame.height - 2)
        self.addSubview(imageView)
        
        let label: UILabel = UILabel(frame: self.bounds)
        label.textColor = .white
        label.textAlignment = .center
        label.text = NSString(format: "%d", digit) as String
        let fontSize = UIDevice.current.userInterfaceIdiom == .pad ? 34.0 : 20.0
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        self.addSubview(label);
        
        self.backgroundColor = .clear
    }
}
