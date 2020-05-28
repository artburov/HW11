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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.backgroundColor = .clear
        firstButton.frame = CGRect(x: 60, y: 680, width: 80, height: 40)
        firstButton.setTitle("myButton", for: .normal)
        firstButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 13)
        firstButton.titleLabel?.textColor  = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        //        view.addSubview(firstButton)
        
        //Custom segmented button setup
        let segmentedBtn = SegmentedButton.loadFromNib()
        view.addSubview(segmentedBtn)
        segmentedBtn.frame = CGRect(x: 180, y: 680, width: 200, height: 40)
        segmentedBtn.segmentedFirstButton.backgroundColor = UIColor.green
        segmentedBtn.segmentedSecondButton.backgroundColor = UIColor.clear
        segmentedBtn.segmentedFirstButton.setTitle("First", for: .normal)
        segmentedBtn.segmentedSecondButton.setTitle("", for: .normal)
        
        //        segmentedBtn.segmentedFirstButton.clipsToBounds = true
        //        segmentedBtn.segmentedSecondButton.clipsToBounds = true
        
        //Whole segmented block setings
        segmentedBtn.layer.cornerRadius = segmentedBtn.frame.height * 0.30
        segmentedBtn.layer.borderColor = UIColor.black.cgColor
        segmentedBtn.layer.borderWidth = 2
        
        //First button into segmented block setting
        segmentedBtn.segmentedFirstButton.layer.cornerRadius = segmentedBtn.frame.height * 0.30
        segmentedBtn.segmentedFirstButton.layer.borderColor = UIColor.black.cgColor
        segmentedBtn.segmentedFirstButton.layer.borderWidth = 2
        
    }
    
}
