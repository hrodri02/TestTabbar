//
//  WeekView.swift
//  TestTabbar
//
//  Created by Eri on 1/15/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

class WeekView: UIView
{
    let horizontalSpaceBetweenLabels: CGFloat = (screenWidth - 20 * 7) / 8.0;
    var weekDayViews = [WeekDayView]()
    
    init() {
        super.init(frame: CGRect.zero)
        
        for i in 0 ... 6 {
            let weekDayView = WeekDayView()
            weekDayView.weekDayLabel.text = WEEKDAYS[i]
            weekDayView.layer.cornerRadius = WEEKDAY_VIEW_CORNER_RADIUS
            weekDayView.dayOfTheMonthLabel.text = "\(13 + i)"
            
            if (i + 13)  == 16 {
                weekDayView.backgroundColor = WEEKDAY_VIEW_BG_COLOR
            }
            
            weekDayViews.append(weekDayView)
            self.addSubview(weekDayView)
        }
        
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUIComponents() {
        for i in 0 ... 6 {
            weekDayViews[i].widthAnchor.constraint(equalToConstant: 20).isActive = true
            weekDayViews[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
            weekDayViews[i].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            let m = CGFloat(2*i + 1)/7.0
            NSLayoutConstraint(item: weekDayViews[i], attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: m, constant: 0).isActive = true
        }
    }
    
    
}

