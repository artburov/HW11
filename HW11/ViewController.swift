//
//  ViewController.swift
//  HW11
//
//  Created by Admin on 25.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: myButtons!
    
    //Custom segmented button instance for nib
    let segmentedBtn = SegmentedButton.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.backgroundColor = .clear
        firstButton.frame = CGRect(x: 60, y: 680, width: 80, height: 40)
        firstButton.setTitle("myButton", for: .normal)
        firstButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 13)
        firstButton.titleLabel?.textColor  = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        //view.addSubview(firstButton)
                
        //Delegation handler
        segmentedBtn.delegate = self
                
        //Setup segmented buttons frame
        segmentedBtn.frame = CGRect(x: 180, y: 680, width: 200, height: 40)
        segmentedBtn.segmentedFirstButton.backgroundColor = UIColor.green
        segmentedBtn.segmentedSecondButton.backgroundColor = UIColor.clear
        segmentedBtn.segmentedFirstButton.setTitle("1", for: .normal)
        segmentedBtn.segmentedFirstButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        segmentedBtn.segmentedFirstButton.tintColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        segmentedBtn.segmentedSecondButton.setTitle("", for: .normal)
        view.addSubview(segmentedBtn)
        
        //segmentedBtn.segmentedFirstButton.clipsToBounds = true
        //segmentedBtn.segmentedSecondButton.clipsToBounds = true
        
        //Whole segmented block setings
        segmentedBtn.layer.cornerRadius = segmentedBtn.frame.height * 0.30
        segmentedBtn.layer.borderColor = UIColor.black.cgColor
        segmentedBtn.layer.borderWidth = 2
        
        //Default first button into segmented block setting
        segmentedBtn.segmentedFirstButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
        segmentedBtn.segmentedFirstButton.layer.borderColor = UIColor.black.cgColor
        segmentedBtn.segmentedFirstButton.layer.borderWidth = 2
    }
}

//Delegate implementation for custom segmented controls
extension ViewController: SegmentedButtonDelegate {
    func segmentedButtonOne(_ segmentedButton: SegmentedButton) {
        
        //Default isSelected = false
        if !(segmentedButton.segmentedFirstButton.isSelected) {
            
            //Animation
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
                segmentedButton.transform = CGAffineTransform(scaleX: 0.9, y: 1)
            }) { (finish) in
                UIView.animate(withDuration: 0.4, animations: {
                    segmentedButton.transform = CGAffineTransform.identity
                })
            }
            
            //First segment
            segmentedBtn.segmentedFirstButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
            segmentedBtn.segmentedFirstButton.layer.borderColor = UIColor.black.cgColor
            segmentedBtn.segmentedFirstButton.layer.borderWidth = 2
            segmentedBtn.segmentedFirstButton.backgroundColor = UIColor.green
            segmentedBtn.segmentedFirstButton.setTitle("First", for: .normal)
            segmentedBtn.segmentedFirstButton.tintColor  = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            segmentedBtn.segmentedFirstButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
            
            //Second segment
            segmentedBtn.segmentedSecondButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
            segmentedBtn.segmentedSecondButton.layer.borderColor = UIColor.black.cgColor
            segmentedBtn.segmentedSecondButton.layer.borderWidth = 0
            segmentedBtn.segmentedSecondButton.backgroundColor = UIColor.clear
            segmentedBtn.segmentedSecondButton.setTitle("", for: .normal)
        }
    }
    
    func segmentedButtonTwo(_ segmentedButton: SegmentedButton) {
        
        //Default isSelected = false
        if !(segmentedButton.segmentedSecondButton.isSelected) {
            
            //Animation
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
                segmentedButton.transform = CGAffineTransform(scaleX: 1.1, y: 1)
            }) { (finish) in
                UIView.animate(withDuration: 0.4, animations: {
                    segmentedButton.transform = CGAffineTransform.identity
                })
            }
            
            //Second segment
            segmentedBtn.segmentedSecondButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
            segmentedBtn.segmentedSecondButton.layer.borderColor = UIColor.black.cgColor
            segmentedBtn.segmentedSecondButton.layer.borderWidth = 2
            segmentedBtn.segmentedSecondButton.backgroundColor = UIColor.blue
            segmentedBtn.segmentedSecondButton.setTitle("Second", for: .normal)
            segmentedBtn.segmentedSecondButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
            segmentedBtn.segmentedSecondButton.tintColor  = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            
            //First segment
            segmentedBtn.segmentedFirstButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
            segmentedBtn.segmentedFirstButton.layer.borderColor = UIColor.black.cgColor
            segmentedBtn.segmentedFirstButton.layer.borderWidth = 0
            segmentedBtn.segmentedFirstButton.backgroundColor = UIColor.clear
            segmentedBtn.segmentedFirstButton.setTitle("", for: .normal)
        }
    }
}
