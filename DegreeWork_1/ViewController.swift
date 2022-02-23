//
//  ViewController.swift
//  DegreeWork_1
//
//  Created by Yura on 21.01.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewView: View!
    @IBOutlet weak var constrViewViewWidth: NSLayoutConstraint!
    @IBOutlet weak var constrViewViewHeight: NSLayoutConstraint!
    
    var from: Station? = nil
    var to: Station? = nil
    var state: State = .startStationSelection
    var clickFrom = 0
    var clickTo = 0
    
    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        drawBorder(btn: btnFrom)
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        var pinkLineLbls: [CGPoint] = []
        
        for (index, s) in Consts.pink.enumerated() {
            if 0...4 ~= index {
                let newPos = s.1 + (1, 0)
                pinkLineLbls.append(newPos.cgpoint)
            }
        }
        
        let heightOfLbl = 20.0
        for (index, lbcgPoint) in pinkLineLbls.enumerated() {
            let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 7)
            lbl.frame = CGRect(x: lbcgPoint.x, y: lbcgPoint.y - heightOfLbl / 2,
                               width: 60,
                               height: heightOfLbl)
            lbl.text = Consts.pink[index].0
            lbl.numberOfLines = 0
            scrollViewView.addSubview(lbl)
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
                
                var path: [Station]? = nil
                if from != nil && to != nil {
                    path = Subway.shortestPath(startStation: from!, destination: to!)
                    print(from!)
                }
                if let myView = scrollViewView {
                    myView.path = path
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
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollViewView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        constrViewViewWidth.constant = view?.frame.width ?? 100
        constrViewViewHeight.constant = view?.frame.height ?? 100
        scrollViewView.setNeedsDisplay()
    }
    
}


