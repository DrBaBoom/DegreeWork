//
//  ViewController.swift
//  DegreeWork_1
//
//  Created by Yura on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollViewView: View!
    
    var from: Station? = nil
    var to: Station? = nil
    var state: State = .normal
    var clickFrom = 0
    var clickTo = 0
    
    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        if state == .normal {
            return
        }
        if let touchLoc = sender?.location(in: scrollViewView) {
            var minimalDist = 15.0
            var closestStation: Station? = nil
            for s in Subway.getSubway() {
                let x = s.position.cgpoint.distance(to: touchLoc)
                if x < minimalDist {
                    minimalDist = x
                    closestStation = s
                }
            }
            if let cclosestStation = closestStation {
                if cclosestStation == from || cclosestStation == to {
                    return
                }
                cclosestStation.isSelected = true
                if state == .startStationSelection {
                    from?.isSelected = false
                    from = cclosestStation
                    btnFrom.setTitle(cclosestStation.name, for: .normal)
                } else {
                    to?.isSelected = false
                    to = cclosestStation
                    btnTo.setTitle(cclosestStation.name, for: .normal)
                }
       
                print(cclosestStation)
                if let myView = scrollViewView {
                    myView.redraw()
                }
                
            } else {
                print("Too Far")
            }
        }
    }
    
    
    @IBAction func btnFromPushed(_ sender: Any) {
        state = .startStationSelection
        btnTo.layer.borderWidth = 0
        btnFrom.layer.borderWidth = 2
        btnFrom.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func btnToPushed(_ sender: Any) {
        state = .endSattionSelection
        btnFrom.layer.borderWidth = 0
        btnTo.layer.borderWidth = 2
        btnTo.layer.borderColor = UIColor.red.cgColor
    }
    
}


