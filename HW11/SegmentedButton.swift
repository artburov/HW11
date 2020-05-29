//
//  SegmentedButton.swift
//  HW11
//
//  Created by Admin on 28.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol SegmentedButtonDelegate: class {
    func segmentedButtonOne(_ segmentedButton: SegmentedButton)
    func segmentedButtonTwo(_ segmentedButton: SegmentedButton)
}


class SegmentedButton: UIView {
    
    weak var delegate: SegmentedButtonDelegate?
    
    @IBOutlet weak var segmentedFirstButton: UIButton!
    
    @IBOutlet weak var segmentedSecondButton: UIButton!
    
    static func loadFromNib() -> SegmentedButton {
        let nib = UINib(nibName: "SegmentedButton", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentedButton
    }
    @IBAction func pressedOneSegmentButton(_ sender: UIButton) {
        delegate?.segmentedButtonOne(self)
    }
    @IBAction func pressedSecondSegmentButton(_ sender: UIButton) {
        delegate?.segmentedButtonTwo(self)
    }
}
