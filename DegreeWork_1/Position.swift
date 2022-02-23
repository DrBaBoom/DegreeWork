//
//  Position.swift
//  DegreeWork_1
//
//  Created by Yura on 24.01.2022.
//

import Foundation

class Position {
    let x: Double
    let y: Double
    
    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    static func +(a: Position, b:(Double, Double)) -> Position {
        return Position(a.x + b.0, a.y + b.1)
    }
}

class Shift: Position {
    
}
