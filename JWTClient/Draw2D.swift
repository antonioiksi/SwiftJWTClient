//
//  Draw2D.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 04/05/2018.
//

import UIKit

class Draw2D: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColor(colorSpace: colorSpace, components: components)
        context?.setStrokeColor(color!)
        context?.move(to: CGPoint(x: 30, y: 30))
        context?.addLine(to: CGPoint(x: 300, y: 400))
        context?.strokePath()
    }
    

}
