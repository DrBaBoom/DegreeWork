//
//  View.swift
//  DegreeWork_1
//
//  Created by Yura on 23.01.2022.
//

import UIKit

class View: UIView {
    
    var path: [Station]? = nil
    let lineNameList = ["blueLine", "greenLine", "yellowLine", "redLine", "pinkLine"]
    let colorList: [UIColor] = [.blue, .green, .orange, .red, .purple]
    static var scaleMap = 0.0 // сколько точек в одном квадрате
    
    override func draw(_ rect: CGRect) {
        View.scaleMap = self.bounds.width / 85
        let subway = Subway.getSubway()
        
        if path != nil {
            drawPath(listOfStations: path!)
        }
        
        for (indexColor, l) in lineNameList.enumerated() {
            let stationsOfLine = subway.filter {s in s.lineName == l}
            colorList[indexColor].setStroke()
            colorList[indexColor].setFill()
            let path = UIBezierPath()
            
            for (i, s) in stationsOfLine.enumerated() {
                let point = s.position.cgpoint
                
                if i == 0 {
                    path.move(to: point)
                } else {
                    path.addLine(to: point)
                }
                
                if s.isSelected {
                    let circle: UIBezierPath
                    if s.isSuper {
                        circle = UIBezierPath(ovalIn: CGRect(x: point.x - 10,
                                                                 y: point.y - 10,
                                                                 width: 20, height: 20))
                    } else {
                        circle = UIBezierPath(ovalIn: CGRect(x: point.x - 7,
                                                                 y: point.y - 7,
                                                                 width: 14, height: 14))
                    }
                    UIColor.black.setStroke()
                    circle.stroke()
                    colorList[indexColor].setStroke()
                }
                
                let circle = UIBezierPath(ovalIn: CGRect(x: point.x - 5,
                                                         y: point.y - 5,
                                                         width: 10, height: 10))
                circle.fill()
            }
            path.lineWidth = 3
            path.stroke()
        }
        for s in Subway.superStations {
            drawSuperStation(station: s)
        }
    }
    
    func drawPie(center: CGPoint, radius: CGFloat, colors: [UIColor]) {
        let anglePie = CGFloat.pi * 2.cgfloat / colors.count.cgfloat
        for (i, col) in colors.enumerated() {
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center,
                        radius: radius,
                        startAngle: CGFloat.pi / 2 + anglePie * i.cgfloat,
                        endAngle: anglePie + CGFloat.pi / 2 + i.cgfloat * anglePie,
                        clockwise: true)
            col.setFill()
            path.fill()
        }
    }
    
    func drawSuperStation(station: Station) {
        var colors: [UIColor] = []
        for s in station.closestStations {
            let col = colorList[lineNameList.firstIndex(of: s.lineName)!]
            if !colors.contains(col) {
                colors.append(col)
            }
        }
        drawPie(center: station.position.cgpoint, radius: 8.cgfloat, colors: colors)
    }
    
    func drawPath(listOfStations: [Station]) {
        if listOfStations.count > 1 {
            let line = UIBezierPath()
            line.move(to: listOfStations[0].position.cgpoint)
            for i in 1 ..< listOfStations.count {
                line.addLine(to: listOfStations[i].position.cgpoint)
            }
            UIColor.gray.setStroke()
            line.lineWidth = 8
            line.stroke()
        }
    }
    
    func redraw() {
        self.setNeedsDisplay()
    }
    
}

