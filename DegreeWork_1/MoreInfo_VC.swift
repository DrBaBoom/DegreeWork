//
//  MoreInfo_VC.swift
//  DegreeWork_1
//
//  Created by Yura on 26.02.2022.
//

import UIKit

class MoreInfo_VC: UIViewController {

    @IBOutlet weak var cnstrHeight: NSLayoutConstraint!
    @IBOutlet weak var stcView: UIStackView!
    
    var path: [Station] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if path.count > 0 {
            for s in path {
                let lbl = SuperLabel()
                let color = Consts.colorList[Consts.lineNameList.firstIndex(of: s.lineName)!]
                lbl.setColorAndText(color: color, text: s.name)
                stcView.addArrangedSubview(lbl)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        cnstrHeight.constant = SuperLabel.height * CGFloat(path.count)
                               
    }
    
//    func setPath(path: [Station]) {
//        self.path = path
//    }
}
