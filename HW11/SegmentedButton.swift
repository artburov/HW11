//
//  SegmentedButton.swift
//  HW11
//
//  Created by Admin on 28.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class SegmentedButton: UIView {
    
    @IBOutlet weak var segmentedFirstButton: UIButton!
    
    @IBOutlet weak var segmentedSecondButton: UIButton!
    
    static func loadFromNib() -> SegmentedButton {
        let nib = UINib(nibName: "SegmentedButton", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentedButton
    }
}
