//
//  ViewController.swift
//  DegreeWork_1
//
//  Created by Yura on 21.01.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var btnMoreInfo: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewView: View!
    @IBOutlet weak var constrViewViewWidth: NSLayoutConstraint!
    @IBOutlet weak var constrViewViewHeight: NSLayoutConstraint!
    
    var from: Station? = nil
    var to: Station? = nil
    var state: State = .startStationSelection
    var clickFrom = 0
    var clickTo = 0
    var fullPath: [Station] = []
    
    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMoreInfo.alpha = 0
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        drawBorder(btn: btnFrom)
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollViewView
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let heightOfLbl = 20.0
        let widthOfLbl = 60.0
        
        for line in Consts.allLines {
            for s in line {
                let lbl = UILabel()
                lbl.font = UIFont.systemFont(ofSize: 7)
                let lblPoint: CGPoint
                if s.lblLeft {
                    lblPoint = (s.pos - s.shift).cgpoint - (widthOfLbl, 0)
                    lbl.textAlignment = .right
                } else {
                    lblPoint = (s.pos + s.shift).cgpoint
                }
                lbl.frame = CGRect(x: lblPoint.x, y: lblPoint.y - heightOfLbl / 2,
                                   width: widthOfLbl,
                                   height: heightOfLbl)
                lbl.text = s.name
                lbl.numberOfLines = 0
                scrollViewView.addSubview(lbl)
                
                
            }
        }
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
                fullPath = []
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
                
                if from != nil && to != nil {
                    fullPath = Subway.shortestPath(startStation: from!, destination: to!)
                    btnMoreInfo.alpha = 1
                }
                if let myView = scrollViewView {
                    myView.path = fullPath
                    myView.redraw()
                }
                
            } else {
                print("Too Far")
            }
        }
    }
    
    @IBAction func btnFromPushed(_ sender: Any) {
        state = .startStationSelection
        drawBorder(btn: btnFrom)
    }
    
    @IBAction func btnToPushed(_ sender: Any) {
        state = .endSatationSelection
        drawBorder(btn: btnTo)

    }
    
    func drawBorder(btn: UIButton) {
        if btn == btnFrom {
            btnTo.layer.borderWidth = 0
            btnFrom.layer.borderWidth = 2
            btnFrom.layer.borderColor = UIColor.blue.cgColor
        } else {
            btnFrom.layer.borderWidth = 0
            btnTo.layer.borderWidth = 2
            btnTo.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MoreInfo_VC, segue.identifier == "segMoreInfo" {
            vc.path = fullPath
        }
    }
    
}


