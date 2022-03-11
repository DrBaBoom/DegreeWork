//
//  SuperLabel.swift
//  DegreeWork_1
//
//  Created by Yura on 26.02.2022.
//

import UIKit

class SuperLabel: UIView {

    var color: UIColor = .white
    var text: String = "ghuhguhurhguehughe"
    let line = UIView()
    let round = UIView()
    let label = UILabel()
    static let height: CGFloat = 50
    
    func setColorAndText (color: UIColor, text: String) {
        self.color = color
        self.text = text
    }
    
    override func layoutSubviews() {
        
        self.frame = CGRect(x: self.frame.origin.x,
                            y: self.frame.origin.y,
                            width: self.frame.width,
                            height: SuperLabel.height)
        
        let width = self.frame.width
        let height = self.frame.height
        let lineXstart = width / 7
        let lineWidth = width / 45
        let diameter = lineWidth * 2.5
        let labelXstart = lineXstart + width / 15
        
        line.frame = CGRect(x: lineXstart, y: 0, width: lineWidth, height: height)
        line.backgroundColor = color
        
        round.frame = CGRect(x: lineXstart + lineWidth / 2 - diameter / 2,
                             y: height / 2 - diameter / 2,
                             width: diameter,
                             height: diameter)
        round.backgroundColor = color
        round.layer.cornerRadius = diameter / 2
        
        label.frame = CGRect(x: labelXstart, y: 0, width: width - labelXstart, height: height)
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = self.text
        
        let forms = [line, round, label]
        
        for i in forms {
            addSubview(i)
        }
        
        
    }

}
