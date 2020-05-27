//
//  ClockView.swift
//  HW11
//
//  Created by Admin on 25.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    
    var isSetuped = false
    
    var markerSize: CGFloat = 4
    var markerLength: CGFloat = 12
    var markerColor = UIColor.blue
    
    @IBInspectable var hourLineSize: CGFloat = 8 {
        didSet {layoutIfNeeded()}
    }
    
    @IBInspectable var hourLineOffset: CGFloat = 50 {
        didSet {layoutSubviews()}
    }
    
    @IBInspectable var hourLineColor: UIColor = UIColor.green {
        didSet {hourLine.backgroundColor = hourLineColor }
    }
    
    var centerRoundColor = UIColor.green
    
    //Hours in integer value with Observer
    @IBInspectable var hours: CGFloat = 21 {
        didSet {
            //            updateHours()
            layoutIfNeeded()
        }
    }
    
    var minuteLineSize: CGFloat = 4
    var minuteLineOffset: CGFloat = 35
    var minuteLineColor = UIColor.green
    
    //Minutes in integer value with Observer
    var minutes: CGFloat = 27 {
        didSet {
            updateMinutes()
        }
    }
    
    var secondLineSize: CGFloat = 1
    var secondLineOffset: CGFloat = 35
    var secondLineColor = UIColor.red
    
    //Second in integer value with Observer
    var second: CGFloat = 52 {
        didSet {
            updateSecond()
        }
    }
    
    //Markers
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    //Hour line
    private let hourLine = UIView()
    
    //Minute Line
    private let minuteLine = UIView()
    
    //Second Line
    private let secondLine = UIView()
    
    //Center dot
    private let centerRound = UIView()
    

    // Visualize changes in storyboard
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    //Func to draw all in layout
    // override func layoutSubviews() {
    // super.layoutSubviews()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //Setting function for all elements
    func setup() {
    
        //Added rotation angle for hour line, ex. x0 y0 is a point at the left top corner
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        //Added rotation angle for minute line
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        //Added rotation angle for second line
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)        
        
        //Width and Height constants
        let w = frame.size.width
        let h = frame.size.height
        
        //Clock's blue markers settings
        topMarker.frame  = CGRect(x: w / 2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2, width: markerLength, height: markerSize)
        bottomMarker.frame  = CGRect(x: w / 2, y: h - markerLength, width: markerSize, height: markerLength)
        
        //Hour's line settings
        hourLine.frame = CGRect(x: w / 2, y: hourLineOffset, width: hourLineSize, height: h / 2 - hourLineOffset)
        hourLine.backgroundColor = hourLineColor
        updateHours()
        
        //Minute's line settings
        minuteLine.frame = CGRect(x: w / 2, y: minuteLineOffset, width: minuteLineSize, height: h / 2 - minuteLineOffset)
        minuteLine.backgroundColor = minuteLineColor
        updateMinutes()
        
        //Second's line settings
        secondLine.frame = CGRect(x: w / 2, y: secondLineOffset, width: secondLineSize, height: h / 2 - secondLineOffset)
        secondLine.backgroundColor = secondLineColor
        updateSecond()
        
        //Center dot settings
        centerRound.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        centerRound.backgroundColor = centerRoundColor
        centerRound.layer.cornerRadius = 8
        
        //added to all Clock's marker the same color in loop
        for v in [topMarker, leftMarker, rightMarker, bottomMarker] {
            v.backgroundColor = markerColor
        }
        
        //UIView radius is 50% of the frame width, it is the main View for clock
        layer.cornerRadius = frame.size.width / 2
        
        //Flag just for one settings
        if isSetuped {return}
        isSetuped = true
        
        //Added all UIViews to subview in loop
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, centerRound] {
            addSubview(v)
        }
    }
    
    //Func to calculate angle for hour's line
    func updateHours () {
        guard hours <= 24 else {return}
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    //Func to calculate angle for minute's line
    func updateMinutes() {
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    //Func to calculate angle for second's line
    func updateSecond() {
        let angle = CGFloat.pi * 2 * (second / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
