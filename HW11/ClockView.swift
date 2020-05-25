//
//  ClockView.swift
//  HW11
//
//  Created by Admin on 25.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    var isSetuped = false
    
    var markerSize: CGFloat = 4
    var markerLength: CGFloat = 12
    var markerColor = UIColor.blue
    
    var hourLineSize: CGFloat = 6
    var hourLineOffset: CGFloat = 40
    var hourLineColor = UIColor.green
    
    var centerRoundColor = UIColor.green
    
    //Hours in integer value with Observer
    var hours: CGFloat = 9 {
        didSet {
            updateHours()
        }
    }
    
    //Markers
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    //Hour line
    private let hourLine = UIView()
    
    //Center dot
    private let centerRound = UIView()
    
    //Func to draw all in layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Added rotation angle for hour line, ex. x0 y0 is a point at the left top corner
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
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
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, centerRound] {
            addSubview(v)
        }
    }
    
    //Func to calculate angle for hour's line
    func updateHours () {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
