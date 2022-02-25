//
//  Extantions.swift
//  DegreeWork_1
//
//  Created by Yura on 26.01.2022.
//

import Foundation
import UIKit

extension Int {
    var cgfloat: CGFloat {
        get { return CGFloat(self) }
    }
}

extension Position {
    var cgpoint: CGPoint {
        get { return CGPoint(x: self.x * View.scaleMap,
                             y: self.y * View.scaleMap + 5 * View.scaleMap) }
    }
}

extension CGPoint {
    func distance(to anotherPoint: CGPoint) -> Double {
        return sqrt(pow(anotherPoint.x - self.x, 2.0) + pow(anotherPoint.y - self.y, 2.0))
    }
    
    static func -(a: CGPoint, b: (Double, Double)) -> CGPoint {
        return CGPoint(x: a.x - b.0, y: a.y - b.1)
    }
}
