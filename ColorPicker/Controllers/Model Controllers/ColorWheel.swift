//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by Aaron Cleveland on 1/23/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class ColorWheel: UIView {

    // MARK: - Properties
    var color: UIColor = .white
    var brightness: CGFloat = 0.8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - View Lifecycles
   
    override func layoutSubviews() {
        super.layoutSubviews()
        isUserInteractionEnabled = false
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing Code
        let size: CGFloat = 1
        
        for y in stride(from: 0, to: bounds.maxY, by: size) {
            for x in stride(from: 0, to: bounds.maxX, by: size) {
                let color = self.color(for: CGPoint(x: x, y: y))
                let pixel = CGRect(x: x, y: y, width: size, height: size)
                color.set()
                UIRectFill(pixel)
            }
        }
    }
    
    func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offset = CGPoint(x: dx / center.x, y: dy / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }

}
