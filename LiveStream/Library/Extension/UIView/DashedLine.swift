//
//  DashedLine.swift
//  LiveStream
//
//  Created by Apple on 10/30/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

extension UIView {
    func addDashedBorder() {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.6745098039, green: 0.7058823529, blue: 0.7450980392, alpha: 1)
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [2,3]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
